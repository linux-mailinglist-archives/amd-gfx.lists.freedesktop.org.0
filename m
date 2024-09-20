Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3859697D1A7
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2024 09:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D11610E7CA;
	Fri, 20 Sep 2024 07:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="YQCi76sN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA1110E77A
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2024 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726802494;
 bh=shxUc18DoBNRsdkk9C5y4x+v7snjoAnIdhKh0M5V5Zo=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=YQCi76sNTPm1EOjadAr4aP8rAtTusvdhJGiH3J5b//fD0Qcl4hJUDqHLRfULQnAjC
 iON4qvcIiaFAHT/4/uEMGvQ1Chzj8H4dhkRuN65y3WI8kGCYi/J83WQ0l1umxI9kEj
 ARQalV5tseFuuyzvRNnJ637Zls9OaXOawZUJThVw=
X-QQ-mid: bizesmtp80t1726802464t2p7zzip
X-QQ-Originating-IP: +QAnzIjD+lFPrmz2QT6gcaLhCxuM+Mtsn6KjiI+9+9w=
Received: from [10.20.53.22] ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 20 Sep 2024 11:21:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2284525689725457276
Message-ID: <1839F46EBABE4C15+d6a788fb-05ce-4281-a16f-d6ecb21da8e2@uniontech.com>
Date: Fri, 20 Sep 2024 11:21:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 yifan1.zhang@amd.com, Tim.Huang@amd.com, jesse.zhang@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com,
 pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
 <0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Uun9fRmh4xSP0NYMUlTG7U73"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-Mailman-Approved-At: Fri, 20 Sep 2024 07:23:04 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Uun9fRmh4xSP0NYMUlTG7U73
Content-Type: multipart/mixed; boundary="------------xO8JoEoqvqfP97ZWoykpG3RW";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 yifan1.zhang@amd.com, Tim.Huang@amd.com, jesse.zhang@amd.com,
 Prike.Liang@amd.com, Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com, tao.zhou1@amd.com,
 pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
Message-ID: <d6a788fb-05ce-4281-a16f-d6ecb21da8e2@uniontech.com>
Subject: Re: [PATCH] treewide: Correct the typo 'acccess'
References: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
 <0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de>
In-Reply-To: <0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de>

--------------xO8JoEoqvqfP97ZWoykpG3RW
Content-Type: multipart/mixed; boundary="------------LNvD65nY6HiRo2dRWRoV2GUg"

--------------LNvD65nY6HiRo2dRWRoV2GUg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAyNC85LzIwIDAyOjU4LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCg0KPiBIaQ0K
Pg0KPiBBbSAxOS4wOS4yNCB1bSAyMDoyOCBzY2hyaWViIFdhbmdZdWxpOg0KPj4gVGhlcmUg
YXJlIHNvbWUgc3BlbGxpbmcgbWlzdGFrZXMgb2YgJ2FjY2Nlc3MnIGluIGNvbW1lbnRzIHdo
aWNoDQo+PiBzaG91bGQgYmUgaW5zdGVhZCBvZiAnYWNjZXNzJy4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBXYW5nWXVsaSA8d2FuZ3l1bGlAdW5pb250ZWNoLmNvbT4NCj4+IC0tLQ0KPj4g
wqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMV8wLmPCoMKgIHwgMiArLQ0K
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jwqAgfCAyICst
DQo+PiDCoCBkcml2ZXJzL2xlZHMvcmdiL2xlZHMtZ3JvdXAtbXVsdGljb2xvci5jIHwgMiAr
LQ0KPg0KPiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIG1ha2UgMiBwYXRjaGVzOiBvbmUgZm9y
IGFtZGdwdSBhbmQgb25lIGZvciANCj4gbGVkcy4gRWFjaCBwYXRjaCBjYW4gdGhlbiBnbyBp
bnRvIHRoZSBjb3JyZWN0IHRyZWUuDQo+DQo+IElmIHlvdSBtYWtlIDIgcGF0Y2hlcywgeW91
IGNhbiBhZGQNCj4NCj4gQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPg0KPiB0byBlYWNoIG9mIHRoZW0uDQo+DQpEb25lLg0KDQpMaW5rOiAN
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9GMjVBMTM5Nzg5RTg3QzNFKzIwMjQwOTIw
MDIyNzU1LjExNjI0OTUtMS13YW5neXVsaUB1bmlvbnRlY2guY29tLw0KDQpMaW5rOiANCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9CNTg2QTFFNkVBNDc2QjY4KzIwMjQwOTIwMDI0
NTE0LjExODIyOTItMS13YW5neXVsaUB1bmlvbnRlY2guY29tLw0KDQpBbmQgdGhlcmUgaXMg
b25lIG1vcmUgImFjY2Nlc3MiIHR5cG8gZml4Og0KDQpMaW5rOiANCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC83ODFDMTI3OTk0MjFEMzY2KzIwMjQwOTIwMDMxNjIwLjEyMTE3NTIt
MS13YW5neXVsaUB1bmlvbnRlY2guY29tLw0KDQpBZnRlciB0aGF0LCB0aGVyZSBpcyBubyBt
b3JlICJhY2NjZXNzIiB0eXBvIGluIGtlcm5lbCBzb3VyY2UuDQoNCj4gQmVzdCByZWdhcmRz
DQo+IFRob21hcw0KPg0KPg0KQ2hlZXJzLA0KLS0gDQpXYW5nWXVsaQ0K
--------------LNvD65nY6HiRo2dRWRoV2GUg
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------LNvD65nY6HiRo2dRWRoV2GUg--

--------------xO8JoEoqvqfP97ZWoykpG3RW--

--------------Uun9fRmh4xSP0NYMUlTG7U73
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZuzqHQUDAAAAAAAKCRDF2h8wRvQL7pVK
AP49ateMZvPmMrtIAGtl2B5sMSmigX8nowDUucjoVLIHsgEApmKMzxPJTdSx3QyF79iw7OmEPVwK
nbMH0+Ox0wYgKwM=
=lzHO
-----END PGP SIGNATURE-----

--------------Uun9fRmh4xSP0NYMUlTG7U73--
