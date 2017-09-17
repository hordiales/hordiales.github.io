
# Análisis de canciones escuchadas con Spotify


La API brinda un montón de información por cada track escuchado, pero solo se tuvieron en cuenta para el análisis la duración, popularidad y ubicación de la canción en album (número de track). 

Origen de los datos: API oficial (https://developer.spotify.com/web-api/) usando la librería spotipy (https://github.com/plamere/spotipy).

Cantidad: Aproximadamente los últimos 50 tracks escuchados.

### Pasos previos para obtener la info vía la API y guardarla en un .csv


```python
# Obtener la info vía la API

# sudo pip3 install spotipy
# oficial api doc: https://developer.spotify.com/web-api/
# python spotify library: https://github.com/plamere/spotipy
# Doc Reference: http://spotipy.readthedocs.io/en/latest/
# Sacar token en Spotify.com: https://developer.spotify.com/my-applications/
# Examples: https://github.com/plamere/spotipy/tree/master/examples

import spotipy
import spotipy.util as util
import json
import urllib3
#import os
#os.environ["SPOTIPY_CLIENT_ID"] = ""
#os.environ["SPOTIPY_CLIENT_SECRET"] = ""
#os.environ["SPOTIPY_REDIRECT_URI"] = "http://localhost:8888/callback"
#username = os.environ["SPOTIFY_USERNAME"]

scope = 'user-read-recently-played'
cantidad = 50
token = util.prompt_for_user_token(username, scope)
```


```python
# Obtener los últimos 50 tracks escuchados

http = urllib3.PoolManager()
url = 'https://api.spotify.com/v1/me/player/recently-played?limit='+str(cantidad)
headers = {'Content-Type': 'application/json',
           'Authorization': 'Bearer '+token}
r = http.request('GET', url, headers=headers)
```


```python
# Grabar toda la información en archivos json por separado

#tracks = json.loads(r.data)
#for item in tracks['items']:
#    track = item['track']
#    track['played_at'] = item['played_at']
#    with open(dirname+track['id']+'.json', 'w') as out:
#        out.write(json.dumps(track))

# Grabar el .csv
#x = pd.DataFrame(data=[])
#id_list = list()
#duration_list = list()
#popularity_list = list()
#popularity_list = list()
#track_number_list = list()
#played_at_list = list()
#for subdir, dirs, files in os.walk(files_dir):
#    for f in files:
#        if os.path.splitext(f)[1]==".json":
#            data = json.load( open(files_dir + "/" + f,'r') )
#            id_list.append( os.path.splitext(f)[0] )
#            duration_list.append( data['duration_ms'] )
#            popularity_list.append( data['popularity'] )
#            track_number_list.append( data['track_number'] )
#            played_at_list.append( data['played_at'] )
#x['spotify_id'] = id_list
#x['duration_ms'] = duration_list
#x['popularity'] = popularity_list
#x['track_number'] = track_number_list
#x['played_at'] = played_at_list

#x.to_csv('canciones_escuchadas.csv') # grabar .csv
```

## Se levanta dataset del .csv


```python
import pandas as pd
x = pd.DataFrame.from_csv('dataset-spotify/canciones_escuchadas.csv')
x
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>spotify_id</th>
      <th>duration_ms</th>
      <th>popularity</th>
      <th>track_number</th>
      <th>played_at</th>
    </tr>
    <tr>
      <th>index</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>05j5TH07znU7BPbz21pYbk</td>
      <td>167151</td>
      <td>0</td>
      <td>3</td>
      <td>2017-08-08T05:16:19.223Z</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0B5vHrBko4yCY0ExpUGSiq</td>
      <td>264426</td>
      <td>16</td>
      <td>6</td>
      <td>2017-08-02T04:39:14.920Z</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0oMyfSwnXVaQAZ28ZcjWGA</td>
      <td>250640</td>
      <td>44</td>
      <td>1</td>
      <td>2017-08-03T06:35:39.996Z</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0QwZfbw26QeUoIy82Z2jYp</td>
      <td>166266</td>
      <td>71</td>
      <td>1</td>
      <td>2017-09-15T23:33:53.637Z</td>
    </tr>
    <tr>
      <th>4</th>
      <td>10SLqGymC9D3pkS0HO8CRW</td>
      <td>370111</td>
      <td>0</td>
      <td>7</td>
      <td>2017-08-15T06:40:05.175Z</td>
    </tr>
    <tr>
      <th>5</th>
      <td>13x5DIPCUlYCIbU9n4gE7P</td>
      <td>248546</td>
      <td>51</td>
      <td>6</td>
      <td>2017-08-30T01:05:40.315Z</td>
    </tr>
    <tr>
      <th>6</th>
      <td>16k2l6Mr9CIGdZ9B41964P</td>
      <td>643155</td>
      <td>0</td>
      <td>6</td>
      <td>2017-08-08T05:27:43.196Z</td>
    </tr>
    <tr>
      <th>7</th>
      <td>17rf2oZYDVymJeYI9ftDXc</td>
      <td>309973</td>
      <td>55</td>
      <td>3</td>
      <td>2017-09-10T23:45:03.023Z</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1b1BxkyPd5NMbmPdpVzdzu</td>
      <td>255866</td>
      <td>51</td>
      <td>1</td>
      <td>2017-08-30T00:54:12.178Z</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1jzDzZWeSDBg5fhNc3tczV</td>
      <td>166693</td>
      <td>74</td>
      <td>2</td>
      <td>2017-09-15T23:36:49.526Z</td>
    </tr>
    <tr>
      <th>10</th>
      <td>1kmt371vlHtTxQESLo1ekK</td>
      <td>188933</td>
      <td>24</td>
      <td>7</td>
      <td>2017-08-01T07:10:06.887Z</td>
    </tr>
    <tr>
      <th>11</th>
      <td>1MD4tX2g5hx0D2WQ6JsC2m</td>
      <td>210666</td>
      <td>58</td>
      <td>2</td>
      <td>2017-08-02T04:23:52.112Z</td>
    </tr>
    <tr>
      <th>12</th>
      <td>1QUNv7oFOr9kAqer7xCbRt</td>
      <td>260879</td>
      <td>37</td>
      <td>2</td>
      <td>2017-08-25T06:25:59.071Z</td>
    </tr>
    <tr>
      <th>13</th>
      <td>24TX7lkw91Btkt7KJGvQgP</td>
      <td>156706</td>
      <td>19</td>
      <td>2</td>
      <td>2017-08-02T04:25:12.586Z</td>
    </tr>
    <tr>
      <th>14</th>
      <td>2Bc4llhjJBW77I552RgA3L</td>
      <td>464293</td>
      <td>59</td>
      <td>3</td>
      <td>2017-08-01T07:19:03.436Z</td>
    </tr>
    <tr>
      <th>15</th>
      <td>2ClyVqe2QMALHpswQvOsyU</td>
      <td>337733</td>
      <td>43</td>
      <td>9</td>
      <td>2017-08-30T00:37:41.172Z</td>
    </tr>
    <tr>
      <th>16</th>
      <td>2D0ZzJCT6M93QVWbrhS2ga</td>
      <td>470066</td>
      <td>47</td>
      <td>6</td>
      <td>2017-09-12T00:28:26.116Z</td>
    </tr>
    <tr>
      <th>17</th>
      <td>2EFGPGdkzfkuVKQj4WwQrG</td>
      <td>201506</td>
      <td>15</td>
      <td>5</td>
      <td>2017-08-02T04:35:53.407Z</td>
    </tr>
    <tr>
      <th>18</th>
      <td>2MZSXhq4XDJWu6coGoXX1V</td>
      <td>125520</td>
      <td>71</td>
      <td>9</td>
      <td>2017-08-03T06:49:05.266Z</td>
    </tr>
    <tr>
      <th>19</th>
      <td>2VyBwEKfSOSZk5tSsW605v</td>
      <td>270782</td>
      <td>0</td>
      <td>5</td>
      <td>2017-08-08T05:23:12.736Z</td>
    </tr>
    <tr>
      <th>20</th>
      <td>30b7etegIkCs41boVC9O4P</td>
      <td>312586</td>
      <td>61</td>
      <td>1</td>
      <td>2017-09-12T00:36:17.012Z</td>
    </tr>
    <tr>
      <th>21</th>
      <td>30Ce5Z3hp3EkyXeyGAeysC</td>
      <td>432546</td>
      <td>52</td>
      <td>2</td>
      <td>2017-08-30T00:58:27.445Z</td>
    </tr>
    <tr>
      <th>22</th>
      <td>3HzWxmvpQU3QHQ59zw1X4V</td>
      <td>417840</td>
      <td>61</td>
      <td>4</td>
      <td>2017-09-15T23:37:50.752Z</td>
    </tr>
    <tr>
      <th>23</th>
      <td>3PTSoQvdubtSsn10jrsHIF</td>
      <td>239093</td>
      <td>15</td>
      <td>4</td>
      <td>2017-08-02T04:31:54.306Z</td>
    </tr>
    <tr>
      <th>24</th>
      <td>3qXEqKdzI3MSGB1FlGMBz5</td>
      <td>395706</td>
      <td>50</td>
      <td>7</td>
      <td>2017-09-10T23:57:10.637Z</td>
    </tr>
    <tr>
      <th>25</th>
      <td>3ZuVfQriS93y6ofwbIf7lp</td>
      <td>314720</td>
      <td>63</td>
      <td>4</td>
      <td>2017-09-15T23:37:19.855Z</td>
    </tr>
    <tr>
      <th>26</th>
      <td>47cdhtxTfp7WvUbDpDeYa2</td>
      <td>171093</td>
      <td>60</td>
      <td>1</td>
      <td>2017-08-30T00:34:48.977Z</td>
    </tr>
    <tr>
      <th>27</th>
      <td>4dIgclJtPuphBciKtMmdFg</td>
      <td>414720</td>
      <td>60</td>
      <td>9</td>
      <td>2017-09-10T23:31:29.425Z</td>
    </tr>
    <tr>
      <th>28</th>
      <td>4EDj8GXOlI45vG4SOfswK3</td>
      <td>304460</td>
      <td>52</td>
      <td>1</td>
      <td>2017-08-01T07:30:49.933Z</td>
    </tr>
    <tr>
      <th>29</th>
      <td>4HhaWfgPrkxHe5a6L4OdTV</td>
      <td>387040</td>
      <td>59</td>
      <td>4</td>
      <td>2017-09-12T00:50:55.707Z</td>
    </tr>
    <tr>
      <th>30</th>
      <td>4kAflSfOBf6Wv5ZD5abUvZ</td>
      <td>348107</td>
      <td>58</td>
      <td>6</td>
      <td>2017-08-01T07:13:15.077Z</td>
    </tr>
    <tr>
      <th>31</th>
      <td>4kBsYpQBUbSIQNLTDF7es2</td>
      <td>417226</td>
      <td>54</td>
      <td>4</td>
      <td>2017-09-10T23:50:12.920Z</td>
    </tr>
    <tr>
      <th>32</th>
      <td>4MpIwDaZdFLafMDcAx4k4q</td>
      <td>282493</td>
      <td>56</td>
      <td>3</td>
      <td>2017-09-15T23:55:21.051Z</td>
    </tr>
    <tr>
      <th>33</th>
      <td>4oC9U4zrIq9B86Ez26B3Qt</td>
      <td>574546</td>
      <td>46</td>
      <td>3</td>
      <td>2017-08-30T00:25:10.924Z</td>
    </tr>
    <tr>
      <th>34</th>
      <td>4QelFzhVgLomeQhvKrwM1S</td>
      <td>168093</td>
      <td>58</td>
      <td>4</td>
      <td>2017-08-25T06:23:10.522Z</td>
    </tr>
    <tr>
      <th>35</th>
      <td>4rGJzeshnLuGbnzMZeFMD0</td>
      <td>300390</td>
      <td>0</td>
      <td>2</td>
      <td>2017-08-08T05:11:19.152Z</td>
    </tr>
    <tr>
      <th>36</th>
      <td>5lD5sdARTKwSzMkSm0c9HA</td>
      <td>278674</td>
      <td>1</td>
      <td>1</td>
      <td>2017-08-08T05:06:40.526Z</td>
    </tr>
    <tr>
      <th>37</th>
      <td>5pKuBVhP1BmHMeddgGiKz8</td>
      <td>235653</td>
      <td>47</td>
      <td>1</td>
      <td>2017-08-25T06:30:20.752Z</td>
    </tr>
    <tr>
      <th>38</th>
      <td>5T8EDUDqKcs6OSOwEsfqG7</td>
      <td>209413</td>
      <td>78</td>
      <td>12</td>
      <td>2017-09-15T23:34:32.667Z</td>
    </tr>
    <tr>
      <th>39</th>
      <td>62oNfnQqObaqARM0DTibAL</td>
      <td>364493</td>
      <td>60</td>
      <td>4</td>
      <td>2017-09-15T23:44:47.855Z</td>
    </tr>
    <tr>
      <th>40</th>
      <td>64or0cWQwoPDdLRYXjvJbG</td>
      <td>283506</td>
      <td>65</td>
      <td>1</td>
      <td>2017-08-23T16:12:20.013Z</td>
    </tr>
    <tr>
      <th>41</th>
      <td>67JpKSJ3NM9hVQbkJXOxPi</td>
      <td>228800</td>
      <td>43</td>
      <td>5</td>
      <td>2017-08-03T06:39:53.967Z</td>
    </tr>
    <tr>
      <th>42</th>
      <td>6baN5nSUIVTsUyugSuAj7U</td>
      <td>222373</td>
      <td>51</td>
      <td>1</td>
      <td>2017-08-03T06:51:11.198Z</td>
    </tr>
    <tr>
      <th>43</th>
      <td>6ddszDHOGF5F9NhBGbrIOl</td>
      <td>328145</td>
      <td>21</td>
      <td>5</td>
      <td>2017-08-02T04:18:24.476Z</td>
    </tr>
    <tr>
      <th>44</th>
      <td>6H7zMAVHz056pivmKRPpzm</td>
      <td>129000</td>
      <td>22</td>
      <td>5</td>
      <td>2017-08-01T07:07:55.250Z</td>
    </tr>
    <tr>
      <th>45</th>
      <td>6kRz6Juetg9FgBm7PB1jDl</td>
      <td>515240</td>
      <td>72</td>
      <td>2</td>
      <td>2017-09-12T00:41:30.726Z</td>
    </tr>
    <tr>
      <th>46</th>
      <td>6NQfUZb5VummNR8rozb8Ic</td>
      <td>322813</td>
      <td>62</td>
      <td>1</td>
      <td>2017-08-03T06:43:41.779Z</td>
    </tr>
    <tr>
      <th>47</th>
      <td>6Q3hwOcmdVandZcTS76EQK</td>
      <td>246000</td>
      <td>17</td>
      <td>3</td>
      <td>2017-08-02T04:27:48.286Z</td>
    </tr>
    <tr>
      <th>48</th>
      <td>6yUCeySJMRaSAEsnfqDeZK</td>
      <td>396986</td>
      <td>52</td>
      <td>2</td>
      <td>2017-09-10T23:38:24.116Z</td>
    </tr>
    <tr>
      <th>49</th>
      <td>71m28JeiyMRwiAOfhZ0kvW</td>
      <td>308973</td>
      <td>19</td>
      <td>5</td>
      <td>2017-08-25T06:34:16.802Z</td>
    </tr>
    <tr>
      <th>50</th>
      <td>7CcPe8TICOsQxQLqAN6Ogs</td>
      <td>246134</td>
      <td>0</td>
      <td>4</td>
      <td>2017-08-08T05:19:06.707Z</td>
    </tr>
    <tr>
      <th>51</th>
      <td>7et0LScgInvkXMhRkNq9k8</td>
      <td>419074</td>
      <td>58</td>
      <td>3</td>
      <td>2017-08-30T00:43:04.693Z</td>
    </tr>
    <tr>
      <th>52</th>
      <td>7ezxnrzFzaOoy9yYUhP9S2</td>
      <td>359947</td>
      <td>51</td>
      <td>3</td>
      <td>2017-08-25T06:11:52.249Z</td>
    </tr>
    <tr>
      <th>53</th>
      <td>7KcYTtKsLs1JnNYYohHNv0</td>
      <td>350644</td>
      <td>60</td>
      <td>4</td>
      <td>2017-08-30T00:50:15.718Z</td>
    </tr>
    <tr>
      <th>54</th>
      <td>7q7BSSkNiuZyLgekXgRX13</td>
      <td>240933</td>
      <td>51</td>
      <td>5</td>
      <td>2017-08-01T07:26:48.703Z</td>
    </tr>
    <tr>
      <th>55</th>
      <td>7wqF3BU0ykeKch6BcNqGiT</td>
      <td>267800</td>
      <td>58</td>
      <td>3</td>
      <td>2017-09-15T23:50:52.574Z</td>
    </tr>
  </tbody>
</table>
</div>



## Se filtra y solo se dejan las columnas de interés para agrupar


```python
# Genero una tabla sin el id de spotify ni la fecha+hora de escuchado
xnew = x

del_columns = ['spotify_id', 'played_at']
xnew.drop(del_columns, inplace=True, axis=1)
xnew
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>duration_ms</th>
      <th>popularity</th>
      <th>track_number</th>
    </tr>
    <tr>
      <th>index</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>167151</td>
      <td>0</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>264426</td>
      <td>16</td>
      <td>6</td>
    </tr>
    <tr>
      <th>2</th>
      <td>250640</td>
      <td>44</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>166266</td>
      <td>71</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>370111</td>
      <td>0</td>
      <td>7</td>
    </tr>
    <tr>
      <th>5</th>
      <td>248546</td>
      <td>51</td>
      <td>6</td>
    </tr>
    <tr>
      <th>6</th>
      <td>643155</td>
      <td>0</td>
      <td>6</td>
    </tr>
    <tr>
      <th>7</th>
      <td>309973</td>
      <td>55</td>
      <td>3</td>
    </tr>
    <tr>
      <th>8</th>
      <td>255866</td>
      <td>51</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9</th>
      <td>166693</td>
      <td>74</td>
      <td>2</td>
    </tr>
    <tr>
      <th>10</th>
      <td>188933</td>
      <td>24</td>
      <td>7</td>
    </tr>
    <tr>
      <th>11</th>
      <td>210666</td>
      <td>58</td>
      <td>2</td>
    </tr>
    <tr>
      <th>12</th>
      <td>260879</td>
      <td>37</td>
      <td>2</td>
    </tr>
    <tr>
      <th>13</th>
      <td>156706</td>
      <td>19</td>
      <td>2</td>
    </tr>
    <tr>
      <th>14</th>
      <td>464293</td>
      <td>59</td>
      <td>3</td>
    </tr>
    <tr>
      <th>15</th>
      <td>337733</td>
      <td>43</td>
      <td>9</td>
    </tr>
    <tr>
      <th>16</th>
      <td>470066</td>
      <td>47</td>
      <td>6</td>
    </tr>
    <tr>
      <th>17</th>
      <td>201506</td>
      <td>15</td>
      <td>5</td>
    </tr>
    <tr>
      <th>18</th>
      <td>125520</td>
      <td>71</td>
      <td>9</td>
    </tr>
    <tr>
      <th>19</th>
      <td>270782</td>
      <td>0</td>
      <td>5</td>
    </tr>
    <tr>
      <th>20</th>
      <td>312586</td>
      <td>61</td>
      <td>1</td>
    </tr>
    <tr>
      <th>21</th>
      <td>432546</td>
      <td>52</td>
      <td>2</td>
    </tr>
    <tr>
      <th>22</th>
      <td>417840</td>
      <td>61</td>
      <td>4</td>
    </tr>
    <tr>
      <th>23</th>
      <td>239093</td>
      <td>15</td>
      <td>4</td>
    </tr>
    <tr>
      <th>24</th>
      <td>395706</td>
      <td>50</td>
      <td>7</td>
    </tr>
    <tr>
      <th>25</th>
      <td>314720</td>
      <td>63</td>
      <td>4</td>
    </tr>
    <tr>
      <th>26</th>
      <td>171093</td>
      <td>60</td>
      <td>1</td>
    </tr>
    <tr>
      <th>27</th>
      <td>414720</td>
      <td>60</td>
      <td>9</td>
    </tr>
    <tr>
      <th>28</th>
      <td>304460</td>
      <td>52</td>
      <td>1</td>
    </tr>
    <tr>
      <th>29</th>
      <td>387040</td>
      <td>59</td>
      <td>4</td>
    </tr>
    <tr>
      <th>30</th>
      <td>348107</td>
      <td>58</td>
      <td>6</td>
    </tr>
    <tr>
      <th>31</th>
      <td>417226</td>
      <td>54</td>
      <td>4</td>
    </tr>
    <tr>
      <th>32</th>
      <td>282493</td>
      <td>56</td>
      <td>3</td>
    </tr>
    <tr>
      <th>33</th>
      <td>574546</td>
      <td>46</td>
      <td>3</td>
    </tr>
    <tr>
      <th>34</th>
      <td>168093</td>
      <td>58</td>
      <td>4</td>
    </tr>
    <tr>
      <th>35</th>
      <td>300390</td>
      <td>0</td>
      <td>2</td>
    </tr>
    <tr>
      <th>36</th>
      <td>278674</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>37</th>
      <td>235653</td>
      <td>47</td>
      <td>1</td>
    </tr>
    <tr>
      <th>38</th>
      <td>209413</td>
      <td>78</td>
      <td>12</td>
    </tr>
    <tr>
      <th>39</th>
      <td>364493</td>
      <td>60</td>
      <td>4</td>
    </tr>
    <tr>
      <th>40</th>
      <td>283506</td>
      <td>65</td>
      <td>1</td>
    </tr>
    <tr>
      <th>41</th>
      <td>228800</td>
      <td>43</td>
      <td>5</td>
    </tr>
    <tr>
      <th>42</th>
      <td>222373</td>
      <td>51</td>
      <td>1</td>
    </tr>
    <tr>
      <th>43</th>
      <td>328145</td>
      <td>21</td>
      <td>5</td>
    </tr>
    <tr>
      <th>44</th>
      <td>129000</td>
      <td>22</td>
      <td>5</td>
    </tr>
    <tr>
      <th>45</th>
      <td>515240</td>
      <td>72</td>
      <td>2</td>
    </tr>
    <tr>
      <th>46</th>
      <td>322813</td>
      <td>62</td>
      <td>1</td>
    </tr>
    <tr>
      <th>47</th>
      <td>246000</td>
      <td>17</td>
      <td>3</td>
    </tr>
    <tr>
      <th>48</th>
      <td>396986</td>
      <td>52</td>
      <td>2</td>
    </tr>
    <tr>
      <th>49</th>
      <td>308973</td>
      <td>19</td>
      <td>5</td>
    </tr>
    <tr>
      <th>50</th>
      <td>246134</td>
      <td>0</td>
      <td>4</td>
    </tr>
    <tr>
      <th>51</th>
      <td>419074</td>
      <td>58</td>
      <td>3</td>
    </tr>
    <tr>
      <th>52</th>
      <td>359947</td>
      <td>51</td>
      <td>3</td>
    </tr>
    <tr>
      <th>53</th>
      <td>350644</td>
      <td>60</td>
      <td>4</td>
    </tr>
    <tr>
      <th>54</th>
      <td>240933</td>
      <td>51</td>
      <td>5</td>
    </tr>
    <tr>
      <th>55</th>
      <td>267800</td>
      <td>58</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>



## Gráficos y agrupación por k-means


```python
from sklearn import datasets
from sklearn.cluster import KMeans

import sklearn.metrics as sm
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cm
```


```python
# Se averigua el rango de (número de) tracks posibles 
max_track = max(x.track_number)
print("Rango de tracks: [%i, %i]"%(min(x.track_number), max_track) )
```

    Rango de tracks: [1, 12]



```python
# Plot de duración vs popularidad, anotando el número de track en cada punto/marker...
fig, ax = plt.subplots(figsize=(14,7))
ax.plot(x.duration_ms/1000./60.,x.popularity, ls="", marker="o")
for xi, yi, pidi in zip(x.duration_ms/1000./60.,x.popularity,x.track_number):
    ax.annotate(str(pidi), xy=(xi,yi))

plt.title('Duración (minutos) vs Popularidad (%). Número de track anotado 1 a 12')
plt.show()
```


![png](SpotifyLastSongsAnalysis_files/SpotifyLastSongsAnalysis_13_0.png)



```python
colormap_original = cm.viridis_r(np.linspace(0,1,max_track+1))

plt.figure(figsize=(14,7))
plt.scatter(x.duration_ms/1000./60., x.popularity, c=colormap_original[xnew.track_number], s=40)
plt.title('Duración (minutos) vs Popularidad (%). El color denota nro de track') # más oscuro es más alto
plt.show()
```


![png](SpotifyLastSongsAnalysis_files/SpotifyLastSongsAnalysis_14_0.png)


Se observa que predominan números de tracks bajos, es decir ubicados entre los primeros temas del album o cd, colores verdosos y amarillos, con duraciones menores a 7 minutos. La "popularidad" esta por encima del 40% o por debajo del 20%.

## Agrupación en 3 grupos/clusters y comparación


```python
model = KMeans(n_clusters=3) 
model.fit(xnew)
```




    KMeans(algorithm='auto', copy_x=True, init='k-means++', max_iter=300,
        n_clusters=3, n_init=10, n_jobs=1, precompute_distances='auto',
        random_state=None, tol=0.0001, verbose=0)




```python
plt.figure(figsize=(14,7))
  
colormap_original = cm.viridis_r(np.linspace(0,1,max_track+1))

# Plot the Original Classifications
plt.subplot(2, 2, 1)
plt.scatter(x.duration_ms/1000./60., x.popularity, c=colormap_original[xnew.track_number.as_matrix()], s=40)
plt.title('Original: Color track. Dur vs Pop.')
 
# Plot the Models Classifications
plt.subplot(2, 2, 2)
plt.scatter(x.duration_ms/1000./60., x.popularity, c=colormap_original[model.labels_], s=40)
plt.title('K=3 Classification. Dur vs Pop')

# Plot the Models Classifications
plt.subplot(2, 2, 3)
plt.scatter(x.track_number, x.popularity, c=colormap_original[model.labels_], s=40)
plt.title('K=3 Classification. Track vs Pop')

# Plot the Models Classifications
plt.subplot(2, 2, 4)
plt.scatter(x.track_number, x.duration_ms/1000./60., c=colormap_original[model.labels_], s=40)
plt.title('K=3 Classification. Track vs Dur')

plt.show()
```


![png](SpotifyLastSongsAnalysis_files/SpotifyLastSongsAnalysis_18_0.png)


A partir de la clasficación con k-means en 3 clusters o grupos, se observa que las canciones de mayor duración son pocas, pero en general son muy populares o nada populares (ver extremos en figura de arriba a la derecha). Se ven los 3 grupos claramente diferencidos por duración.

En la figura de abajo a la izquierda, no se observa demasiada correlación en la popularidad y el número de track, hay todo tipo de casos.

Los tracks de duraciones más cortas, menores a 6 minutos, se ubican en el disco también en los primeros lugares hasta el 6 o 7. Luego son casos excepcionales (Figura abajo a la derecha). De nuevo se ven los 3 grupos claramente diferencidos por duración.

## K-means con 5 clusters



```python
# 5 clusters
model = KMeans(n_clusters=5) 
model.fit(x)

plt.figure(figsize=(14,7))
  
colormap_original = cm.viridis_r(np.linspace(0,1,max_track+1))

# Plot the Original Classifications
plt.subplot(2, 2, 1)
plt.scatter(x.duration_ms/1000./60., x.popularity, c=colormap_original[xnew.track_number.as_matrix()], s=40)
plt.title('Original: Color track. Dur vs Pop.')
 
# Plot the Models Classifications
plt.subplot(2, 2, 2)
plt.scatter(x.duration_ms/1000./60., x.popularity, c=colormap_original[model.labels_], s=40)
plt.title('K=5 Classification. Dur vs Pop')

# Plot the Models Classifications
plt.subplot(2, 2, 3)
plt.scatter(x.track_number, x.popularity, c=colormap_original[model.labels_], s=40)
plt.title('K=5 Classification. Track vs Pop')

# Plot the Models Classifications
plt.subplot(2, 2, 4)
plt.scatter(x.track_number, x.duration_ms/1000./60., c=colormap_original[model.labels_], s=40)
plt.title('K=5 Classification. Track vs Dur')

plt.show()
```


![png](SpotifyLastSongsAnalysis_files/SpotifyLastSongsAnalysis_21_0.png)


Dividiendo en 5 clusters, se observan las mismas características que con 3.

A lo sumo, la mayor división permite ver más claramente que los temas de mayor duración, en promedio, tienen mayor popularidad. 

## Conclusiones

A priori, sin utilizar *k-means* se observó que entre las canciones del dataset predominan aquellas con ubicaciones bajas en el album (números bajos de tracks) y duraciones menores a 7 minutos. La "popularidad" se encuenttra o por encima del 40% o por debajo del 20%, pero no en esa franja intermedia.

Luego de agrupar con este algoritmo se pudieron sacar más conclusiones como:
* La tendencia pareciera indicar que no hay termino medio de popularidad, o es muy baja o es alta. Esto se hace más evidente a medida que aumenta la duración de los tracks.
* Se observan grupos con caracaterísticas similares diferenciados por duración.
* No se observa demasiada correlación entre la popularidad y el número de track, hay todo tipo de casos.
* La mayor cantidad de tracks analizados se caracterizan por ser de poca duración y encontrarse entre las primeras ubicaciones del album.

Se podría también incluir en el análisis el valor de "danceability" que forma parte de la información que el sitio brinda por cada track y es almacenada en los archivos .json antes de exportar al .csv común.

La muestra es pequeña, de apenas más que 50 canciones, por lo tanto a lo sumo se puede usar como indicativo de los gustos musicales de los últimos días u horas del usuario. Puede ser interesante analizar una cantidad mucho más grande y comparar si las tendencias identificadas se mantienen o no.


```python

```
