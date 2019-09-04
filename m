Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003EA9B7C
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 09:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4B689ECB;
	Thu,  5 Sep 2019 07:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Wed, 04 Sep 2019 11:06:17 UTC
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA546891FD
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 11:06:17 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.100.89]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M3T5g-1iMzuR0CR6-00qzjE; Wed, 04
 Sep 2019 13:00:31 +0200
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>,
 Tom St Denis <tom.stdenis@amd.com>, Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/amdgpu: Delete an unnecessary check before two function
 calls
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <a3739125-5fa8-cadb-d2b8-8a9f12e9bacd@web.de>
Date: Wed, 4 Sep 2019 13:00:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:MIsHaIZ6eLfpFc4bcLNCrwSAP97Mi/2ouEZOELKUUf/77agSNX2
 rxro93ebz5BdPi6BId9/zy0ZFUFlcX+UOVFCVtbXDKZq6XUuQED9I7fuqpo3e+pQu1SSR0y
 G2r2DRO1y+ipxHYaI1SUnxPYtlOrM0ujCkbnDq7QdOlfnfBar3/zlbHnyJ9NPkfGDdS81yQ
 rQSSYPRUlU5TkpHIf3uHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0v0Nty49yz8=:KHYaug4wD/IYxFrgwahwFi
 g2PDsDVxK33nBUGAamZ2yDW87le4c9UveBh8KNf+8FWNs/2lr3rNgwBNdzuAEF/+SUhjKlDx0
 abhgV59o6kdfmL9SWtjrLMwSBdE8VX1cjpALfYUyeehe0qn/PwsezgQE6Z3vatjIGqIEKmPC5
 /MXXvrTFb2OrzpTwOMWzwu3VGNtA8WF0NX692RO19JaW1B8Tp67+mrJk6UdEFTCd0/R2NBH2u
 i2qb39C6Y1SZpIrzXpCjGT7VaQCYWvyRJPNWNoEchRmQ+PGqYAQyXlPzgV4ZA/i475yz69Rgc
 vspm3qPa7BFGW2m7f/bKrCa+CGxc4X62kA5Z1KUkIiWSSOgRNbzWw2S/JFUrJfUZdaJp8IkPG
 XVve/HylUOWjlfWbHbdUH2QPduP5zbCIMFzxVNIOzYlETCY6V7TzsP1CchhEa9/B+OTrNFqNj
 OLZz0KSrdXoDp1ofhjgCJWianwKANjR1oE3eRqCSYCD4uYiHPCgSamMxOcS2ugut3o8Nt46bK
 T/bs/+6S+XWDwHQcungiJQUc0SFIrFNazXePKid2Yqg7t6qj7Rt3kspH7pY4JfP+ki8vRu4Wq
 hYfROZy8zYsPstxXhKIyP+zi/DFPGEMs0+H9Sabl4QduV1UPrVY5zHYDtCyM7hUM45gxB80to
 4F+VCuhjtnQhglmic9MVXBkjUc3LA8RtMBQagboM5fKyP6PSSfgwat5GKwu+7HMCn7EJF/7UB
 2+HqD6yRkusTTiwmTtoWFz+fee/6TuQ293FDu13HxJd66SDE+TU1rsSBfy1lWiPdauM0YEqrk
 /b/A5X4p14S473IU4XmMIL8uc8KIp6DgZnJUFJcYFGitwOrmSdAupu4B6LaVOweURtYZqQ/nd
 XgB8xCZwYa7p3+HOeHRIi5mYjmYpKkrZIWO/UP3oghoOKVPJelmvtgLazmi7sSfds+EAgYOoH
 EheZhvmKlTE/0mAmOsH01UG0nNzDtAigN6t05BGWqcvxhnkMZ1NmrtH07N1bJ0aNvXBzM2AW2
 2itWWh30Srzf/+U2WI/KXpPZcqbhUPvQKtvbKAqCbr6on4tLF/2RcZ57FkNZTtsB08Ig3qljo
 pYkKaxPQsqO81egHY6Av7+hFEcRYr/AzXTL7RTHwRAvt3wBh9LlkNYVTMVME+7etDzQs6rl49
 M2KhXVgUzJHwyw2fn/tE3tas8DAcxPp++STszNA1jyDVBhgQ==
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:15:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1567595175;
 bh=d2gGjS7PRxCIit8Dvk46MfNkL3iMHMesvVMVXfzHwcg=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=LeZHBfB5kVVnyGM6VOYGQBFd9IWCYVgM0hT4S7vT1ow2gX12W8tuw3x1Okw7C3rZv
 CltCzwwCuOlJlZtt3c3DJwQCv/JDp/+WBuP3vHE0iv5N+dJEUD9vRx/blZsVEWijc8
 K7G0sFqeCeQ7ODnxoTFxBlWcMBvtbbImjJVX1JXU=
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBXZWQsIDQgU2VwIDIwMTkgMTI6MzA6MjMgKzAyMDAKClRoZSBmdW5jdGlvbnMg4oCcZGVidWdm
c19yZW1vdmXigJ0gYW5kIOKAnGtmcmVl4oCdIHRlc3Qgd2hldGhlciB0aGVpciBhcmd1bWVudApp
cyBOVUxMIGFuZCB0aGVuIHJldHVybiBpbW1lZGlhdGVseS4KVGh1cyB0aGUgdGVzdHMgYXJvdW5k
IHRoZSBzaG93biBjYWxscyBhcmUgbm90IG5lZWRlZC4KClRoaXMgaXNzdWUgd2FzIGRldGVjdGVk
IGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgoKU2lnbmVkLW9mZi1ieTogTWFya3Vz
IEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCmluZGV4IDU2NTJjYzcyZWQzYS4uZDMyMWM3MmQ2
M2QxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdm
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAg
LTEwNzYsMTAgKzEwNzYsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX2liX3ByZWVtcHQo
dm9pZCAqZGF0YSwgdTY0IHZhbCkKIAlrdGhyZWFkX3VucGFyayhyaW5nLT5zY2hlZC50aHJlYWQp
OwoKIAl0dG1fYm9fdW5sb2NrX2RlbGF5ZWRfd29ya3F1ZXVlKCZhZGV2LT5tbWFuLmJkZXYsIHJl
c2NoZWQpOwotCi0JaWYgKGZlbmNlcykKLQkJa2ZyZWUoZmVuY2VzKTsKLQorCWtmcmVlKGZlbmNl
cyk7CiAJcmV0dXJuIDA7CiB9CgpAQCAtMTEwMyw4ICsxMTAwLDcgQEAgaW50IGFtZGdwdV9kZWJ1
Z2ZzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCgogdm9pZCBhbWRncHVfZGVidWdm
c19wcmVlbXB0X2NsZWFudXAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JaWYgKGFk
ZXYtPmRlYnVnZnNfcHJlZW1wdCkKLQkJZGVidWdmc19yZW1vdmUoYWRldi0+ZGVidWdmc19wcmVl
bXB0KTsKKwlkZWJ1Z2ZzX3JlbW92ZShhZGV2LT5kZWJ1Z2ZzX3ByZWVtcHQpOwogfQoKICNlbHNl
Ci0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
