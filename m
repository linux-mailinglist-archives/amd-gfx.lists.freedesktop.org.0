Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EE2873061
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Mar 2024 09:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8233210EBDD;
	Wed,  6 Mar 2024 08:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="XgeOBDwi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1805 seconds by postgrey-1.36 at gabe;
 Wed, 06 Mar 2024 06:10:51 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC297112344
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Mar 2024 06:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=ifrPzH3JOedjz6EpS9JzcnMwgK88tlJJAwFc98btsD0=; b=X
 geOBDwiPZGmw0XIBR168sqYKArlMsT17hjf6Vomw/r34aHUuNQAQhlwOauveRDfD
 WRaTcL5xNU+KmrpFPQhDpP8htp+UCZc6ZwWjuPfI4SQcSwrH4/x7FF+XxO9TIZI4
 NWvytAHYvnb8cLq3MNaVfDvrpzT9H5tiTLDCEdDJYY=
Received: from gainerying$163.com ( [14.125.53.77] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Wed, 6 Mar 2024 13:25:22 +0800 (CST)
X-Originating-IP: [14.125.53.77]
Date: Wed, 6 Mar 2024 13:25:22 +0800 (CST)
From: =?GBK?B?stzX08H6?= <gainerying@163.com>
To: amd-gfx@lists.freedesktop.org
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Yat Sin, David" <David.YatSin@amd.com>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re:RE: Why has to offer "/dev/drv/render128" fd when running ROCm
 demo?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <BN9PR12MB511505BAEBB3578722974CFC92222@BN9PR12MB5115.namprd12.prod.outlook.com>
References: <26c1a512.11d3c.18e0edda56b.Coremail.gainerying@163.com>
 <BL1PR12MB51446D775639DE08F0C909F2F7222@BL1PR12MB5144.namprd12.prod.outlook.com>
 <BN9PR12MB511505BAEBB3578722974CFC92222@BN9PR12MB5115.namprd12.prod.outlook.com>
X-NTES-SC: AL_Qu2bC/ubvU8p5CeZYekfm0sQjuY3UcOxvPsk245RO51wjCHp9AwjenpGOmXW1uevBj2oqx2Sbwh35PtYf4BbVqYwKj5KZa7moTcSgWihR6mZJg==
Content-Type: multipart/alternative; 
 boundary="----=_Part_132277_973737821.1709702722722"
MIME-Version: 1.0
Message-ID: <3fadf81a.7dac.18e123934a3.Coremail.gainerying@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3f31C_udlBIgIAA--.48878W
X-CM-SenderInfo: xjdl0vxu1l0wi6rwjhhfrp/xtbBoBqY-mWXwFCgNAACso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Wed, 06 Mar 2024 08:15:13 +0000
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

------=_Part_132277_973737821.1709702722722
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgZmVsaXg6CiAgIFRoYW5rcyBmb3IgeW91ciBraW5kbHkgaGVscC4KCgppIHN0aWxsIGhhcyBh
IHF1ZXN0aW9uLCBpZiBvbiBhIHB1cmUtY29tcHV0ZSBwbGF0Zm9ybSwgd2hpY2ggaGFzIG5vIC9k
ZXYvZHJpL3JlbmRlciBub2RlLCBidXQgb25seSB3aXRoIGEgc2luZ2xlIC9kZXYva2ZkIG5vZGUs
IGhvdyB0aGUgY29tcHVlIHNjZW5hcmlvIHdvcmtzIHNpbmNlIHRoYXQgd2VpIGhhdmUgbm8gInJl
bmRlciIgZmQgZXhpc3RzPwoKaXMgc3VjaCBwbGF0Zm9tKHdpdGhvdXQgcmVuZGVyIG5vZGUpIGV4
aXN0cz8gCgoKIHRoYW5rcyBmb3IgeW91ciBraW5kbHkgaGVscC4hCgoKQlJzCnpsY2FvLgoKCgoK
CgoKCgoKCgoKQXQgMjAyNC0wMy0wNiAwNDo0MzozMCwgIkt1ZWhsaW5nLCBGZWxpeCIgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgoKW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVy
YWxdCgoKCgoKSSBhbHJlYWR5IGFuc3dlcmVkIHRoaXMgcXVlc3Rpb24gaW4gYSByZXBseSB0byBh
bm90aGVyIGVtYWlsIHRoYXQgd2FzIGFkZHJlc3NlZCB0byBtZToKCiAKClRoZSByZW5kZXIgbm9k
ZXMgYXJlIHVzZWQgZm9yIENQVSBtYXBwaW5nIG9mIFZSQU0gd2l0aCBtbWFwIGNhbGxzIGFuZCBh
biBvZmZzZXQgdGhhdCBpZGVudGlmaWVzIHRoZSBCTy4gVGhlIHJlbmRlciBub2RlIGFsc28gY3Jl
YXRlcyB0aGUgR1BVIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSB0aGF0IGlzIHVzZWQgYnkgS0ZEIHRv
IGNyZWF0ZSB0aGUgR1BVIG1lbW9yeSBtYXBwaW5ncy4gQXBwbGljYXRpb25zIHRoYXQgdXNlIGJv
dGggZ3JhcGhpY3MgYW5kIGNvbXB1dGUgY2FuIHNoYXJlIHRoZSBzYW1lIEdQVSB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2UgaW4gdGhpcyB3YXkuCgogCgpabGNhbywgaW4gdGhlIGZ1dHVyZSwgdGhpcyB0
eXBlIG9mIHF1ZXN0aW9uIG1heSBiZSBiZXR0ZXIgYWRkcmVzc2VkIHRvIGEgbWFpbGluZyBsaXN0
IHN1Y2ggYXMgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcsIGluc3RlYWQgb2Ygd3JpdGlu
ZyBzZXBhcmF0ZWx5IHRvIGRpZmZlcmVudCBtYWludGFpbmVycy4KCiAKClJlZ2FyZHMsCiAgRmVs
aXgKCiAKCiAKCkZyb206IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT4KU2VudDogVHVlc2RheSwgTWFyY2ggNSwgMjAyNCAzOjE3IFBNClRvOrLc19PB+iA8Z2Fp
bmVyeWluZ0AxNjMuY29tPjsgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
PjsgWWF0IFNpbiwgRGF2aWQgPERhdmlkLllhdFNpbkBhbWQuY29tPgpTdWJqZWN0OiBSZTogV2h5
IGhhcyB0byBvZmZlciAiL2Rldi9kcnYvcmVuZGVyMTI4IiBmZCB3aGVuIHJ1bm5pbmcgUk9DbSBk
ZW1vPwoKIAoKW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdCgogCgorIEZlbGl4LCBE
YXZpZCB0byBjb21tZW50LgoKRnJvbTqy3NfTwfogPGdhaW5lcnlpbmdAMTYzLmNvbT4KU2VudDog
VHVlc2RheSwgTWFyY2ggNSwgMjAyNCA4OjQ2IEFNClRvOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFs
ZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+ClN1YmplY3Q6IFdoeSBoYXMgdG8gb2ZmZXIgIi9kZXYv
ZHJ2L3JlbmRlcjEyOCIgZmQgd2hlbiBydW5uaW5nIFJPQ20gZGVtbz8KCiAKCkhpIGFsZXhhbmRl
ci46CgogICAgICBzb3JyeSBmb3IgYm90aGVyLiBidXQgaSByZWFsbHkgbmVlZCBzb21lIGhlbHAg
dG8gZGVhbCB3aXRoIG15IHB1enpsZS4gCgppIGFtIGEgZnJlc2htYW4gdG8gQU1EIEdQVSBEcml2
ZXIsIE5PVyBpIGFtIHRyeWluZyB0byB3cml0ZSBhIHNpbXBsZSBkZW1vIHRvIHVzZSAiL2Rldi9r
ZmQiIGFuZCBkbyBzb21lICB2cmFtIGFsbG9jL2ZyZWUgdGVzdHMsICBidXQgaSBmb3VuZCB5b3Ug
bXVzdCBkbyB0aGUgcmlnaHQgIkFNREtGRF9JT0NfQUNRVUlSRV9WTSIgaW9jdGwgY29tYW1uZCBi
ZWZvcmUgeW91IHRyeSBHUFUgdG8gZG8gdnJhbSBhbGxvY2F0aW9uIGFuZCBvdGhlciB0aGluZ3Mu
ICBmcm9tIHRoZSBrZmQgZHJpdmVyIGNvZGUsdGhlIHByZS1jb25kaXRpb24gdG8gZG8gdGhlIHJp
Z2h0ICJBTURLRkRfSU9DX0FDUVVJUkVfVk0iIGlzIHRvIG9mZmVyIGEgIi9kZXYvZHJ2L3JlbmRl
cjEyOCIgZmQgIHRvIHRoZSBwYXJhbWV0ZXJzLgoKIAoKc28sIHdoeSBuZWVkIHRvIGRvIHRoaXM/
IGtmZCBpcyB1c2VkIGZvciBjb21wdXRlLCBidXQgIi9kZXYvZHJpL3JlbmRlcjEyOCIgaXMgc3Bl
Y2lmeSB0byBnZnggdXNhZ2VkLCB3aHkgbXVzdCBvcGVuIHRoZSAiL2Rldi9kcmkvcmVuZGVyMTI4
IiBkdXJpbmcgdGhlIEtGRCBjb21wdXRlIHNjZW5hcmlvPwoKdGhhbmtzIGZvciB5b3VyIGtpbmRs
eSBoZWxwIQoKIAoKQlJzCgp6bGNhby4KCiA=
------=_Part_132277_973737821.1709702722722
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPkhpIGZlbGl4OjwvZGl2
PjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPiZuYnNwOyAmbmJzcDtUaGFua3MgZm9yIHlvdXIga2lu
ZGx5IGhlbHAuPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvZGl2PjxkaXYgc3R5
bGU9Im1hcmdpbjogMDsiPmkgc3RpbGwgaGFzIGEgcXVlc3Rpb24sIGlmIG9uIGEgcHVyZS1jb21w
dXRlIHBsYXRmb3JtLCB3aGljaCBoYXMgbm8gL2Rldi9kcmkvcmVuZGVyIG5vZGUsIGJ1dCBvbmx5
IHdpdGggYSBzaW5nbGUgL2Rldi9rZmQgbm9kZSwgaG93IHRoZSBjb21wdWUgc2NlbmFyaW8gd29y
a3Mgc2luY2UgdGhhdCB3ZWkgaGF2ZSBubyAicmVuZGVyIiBmZCBleGlzdHM/PGJyPjwvZGl2Pjxk
aXYgc3R5bGU9Im1hcmdpbjogMDsiPmlzIHN1Y2ggcGxhdGZvbSh3aXRob3V0IHJlbmRlciBub2Rl
KSBleGlzdHM/Jm5ic3A7PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvZGl2Pjxk
aXYgc3R5bGU9Im1hcmdpbjogMDsiPiZuYnNwO3RoYW5rcyBmb3IgeW91ciBraW5kbHkgaGVscC4h
PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdp
bjogMDsiPkJSczwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPnpsY2FvLjwvZGl2PjxwIHN0
eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxw
IHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxkaXYgc3R5bGU9InBvc2l0aW9uOnJlbGF0aXZl
O3pvb206MSI+PC9kaXY+PGRpdiBpZD0iZGl2TmV0ZWFzZU1haWxDYXJkIj48L2Rpdj48cCBzdHls
ZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cD5BdCAyMDI0LTAzLTA2IDA0OjQzOjMwLCAiS3VlaGxp
bmcsIEZlbGl4IiAmbHQ7RmVsaXguS3VlaGxpbmdAYW1kLmNvbSZndDsgd3JvdGU6PC9wPjxibG9j
a3F1b3RlIGlkPSJpc1JlcGx5Q29udGVudCIgc3R5bGU9IlBBRERJTkctTEVGVDogMWV4OyBNQVJH
SU46IDBweCAwcHggMHB4IDAuOGV4OyBCT1JERVItTEVGVDogI2NjYyAxcHggc29saWQiPjxkaXYg
eG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVybjpzY2hl
bWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVtYXMtbWlj
cm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0
LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIj4KCgoKPHN0eWxlPjwvc3R5bGU+Cgo8ZGl2IGxhbmc9
IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiIgc3R5bGU9IndvcmQtd3JhcDpi
cmVhay13b3JkIj4KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsO2ZvbnQtc2l6ZToxMHB0O2Nv
bG9yOiMwMDAwRkY7bWFyZ2luOjVwdDtmb250LXN0eWxlOm5vcm1hbDtmb250LXdlaWdodDpub3Jt
YWw7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVmdCI+CltBTUQgT2ZmaWNpYWwgVXNl
IE9ubHkgLSBHZW5lcmFsXTxicj4KPC9wPgo8YnI+CjxkaXY+CjxkaXYgY2xhc3M9IldvcmRTZWN0
aW9uMSI+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjttc28tZmFyZWFzdC1s
YW5ndWFnZTpFTi1VUyI+SSBhbHJlYWR5IGFuc3dlcmVkIHRoaXMgcXVlc3Rpb24gaW4gYSByZXBs
eSB0byBhbm90aGVyIGVtYWlsIHRoYXQgd2FzIGFkZHJlc3NlZCB0byBtZTo8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjttc28tZmFyZWFz
dC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPgo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MzYuMHB0Ij48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7bXNv
LWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPlRoZSByZW5kZXIgbm9kZXMgYXJlIHVzZWQgZm9yIENQ
VSBtYXBwaW5nIG9mIFZSQU0gd2l0aCBtbWFwIGNhbGxzIGFuZCBhbiBvZmZzZXQgdGhhdCBpZGVu
dGlmaWVzIHRoZSBCTy4gVGhlIHJlbmRlciBub2RlCiBhbHNvIGNyZWF0ZXMgdGhlIEdQVSB2aXJ0
dWFsIGFkZHJlc3Mgc3BhY2UgdGhhdCBpcyB1c2VkIGJ5IEtGRCB0byBjcmVhdGUgdGhlIEdQVSBt
ZW1vcnkgbWFwcGluZ3MuIEFwcGxpY2F0aW9ucyB0aGF0IHVzZSBib3RoIGdyYXBoaWNzIGFuZCBj
b21wdXRlIGNhbiBzaGFyZSB0aGUgc2FtZSBHUFUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGluIHRo
aXMgd2F5LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90Oyxz
YW5zLXNlcmlmO21zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwv
c3Bhbj48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAu
NXB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6YmxhY2si
PlpsY2FvLCBpbiB0aGUgZnV0dXJlLCB0aGlzIHR5cGUgb2YgcXVlc3Rpb24gbWF5IGJlIGJldHRl
ciBhZGRyZXNzZWQgdG8gYSBtYWlsaW5nIGxpc3Qgc3VjaCBhcyBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZywgaW5zdGVhZCBvZiB3cml0aW5nIHNlcGFyYXRlbHkgdG8gZGlmZmVyZW50CiBt
YWludGFpbmVycy48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1p
bHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO21zby1mYXJlYXN0LWxhbmd1YWdlOkVO
LVVTIj48bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fu
cy1zZXJpZjttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7bXNvLWZhcmVhc3Qt
bGFuZ3VhZ2U6RU4tVVMiPlJlZ2FyZHMsPGJyPgombmJzcDsgRmVsaXg8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjttc28tZmFyZWFzdC1s
YW5ndWFnZTpFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPgo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4KPGRpdj4KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9y
ZGVyLXRvcDpzb2xpZCAjRTFFMUUxIDEuMHB0O3BhZGRpbmc6My4wcHQgMGNtIDBjbSAwY20iPgo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250
LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1
b3Q7LHNhbnMtc2VyaWYiPiBEZXVjaGVyLCBBbGV4YW5kZXIgJmx0O0FsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20mZ3Q7Cjxicj4KPGI+U2VudDo8L2I+IFR1ZXNkYXksIE1hcmNoIDUsIDIwMjQgMzox
NyBQTTxicj4KPGI+VG86PC9iPiA8L3NwYW4+PHNwYW4gbGFuZz0iWkgtQ04iIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij6y3NfTwfo8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7
Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gJmx0O2dhaW5lcnlp
bmdAMTYzLmNvbSZndDs7IEt1ZWhsaW5nLCBGZWxpeCAmbHQ7RmVsaXguS3VlaGxpbmdAYW1kLmNv
bSZndDs7IFlhdCBTaW4sIERhdmlkICZsdDtEYXZpZC5ZYXRTaW5AYW1kLmNvbSZndDs8YnI+Cjxi
PlN1YmplY3Q6PC9iPiBSZTogV2h5IGhhcyB0byBvZmZlciAiL2Rldi9kcnYvcmVuZGVyMTI4IiBm
ZCB3aGVuIHJ1bm5pbmcgUk9DbSBkZW1vPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPC9kaXY+Cjwv
ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4KPHAgc3R5bGU9
Im1hcmdpbjo1LjBwdCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1mYW1pbHk6
JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibHVlIj5bQU1EIE9mZmljaWFsIFVz
ZSBPbmx5IC0gR2VuZXJhbF08bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPgo8ZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7QXB0b3MmcXVvdDssc2Fucy1zZXJpZjtj
b2xvcjpibGFjayI+KyBGZWxpeCwgRGF2aWQgdG8gY29tbWVudC48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+CjwvZGl2Pgo8ZGl2IGNsYXNzPSJNc29Ob3JtYWwiIGFsaWduPSJjZW50ZXIiIHN0eWxlPSJ0
ZXh0LWFsaWduOmNlbnRlciI+CjxociBzaXplPSIyIiB3aWR0aD0iOTglIiBhbGlnbj0iY2VudGVy
Ij4KPC9kaXY+CjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJp
JnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6YmxhY2siPkZyb206PC9zcGFuPjwvYj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMt
c2VyaWY7Y29sb3I6YmxhY2siPgo8L3NwYW4+PHNwYW4gbGFuZz0iWkgtQ04iIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0O2NvbG9yOmJsYWNrIj6y3NfTwfo8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2Nv
bG9yOmJsYWNrIj4gJmx0Ozwvc3Bhbj48YSBocmVmPSJtYWlsdG86Z2FpbmVyeWluZ0AxNjMuY29t
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJp
JnF1b3Q7LHNhbnMtc2VyaWYiPmdhaW5lcnlpbmdAMTYzLmNvbTwvc3Bhbj48L2E+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5z
LXNlcmlmO2NvbG9yOmJsYWNrIj4mZ3Q7PGJyPgo8Yj5TZW50OjwvYj4gVHVlc2RheSwgTWFyY2gg
NSwgMjAyNCA4OjQ2IEFNPGJyPgo8Yj5Ubzo8L2I+IERldWNoZXIsIEFsZXhhbmRlciAmbHQ7PC9z
cGFuPjxhIGhyZWY9Im1haWx0bzpBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMt
c2VyaWYiPkFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb208L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJp
Zjtjb2xvcjpibGFjayI+Jmd0Ozxicj4KPGI+U3ViamVjdDo8L2I+IFdoeSBoYXMgdG8gb2ZmZXIg
Ii9kZXYvZHJ2L3JlbmRlcjEyOCIgZmQgd2hlbiBydW5uaW5nIFJPQ20gZGVtbz88L3NwYW4+Cjxv
OnA+PC9vOnA+PC9wPgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpw
PjwvcD4KPC9kaXY+CjwvZGl2Pgo8ZGl2Pgo8ZGl2Pgo8cD48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjEwLjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJs
YWNrIj5IaSBhbGV4YW5kZXIuOjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPGRpdj4KPGRpdj4KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1p
bHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjayI+Jm5ic3A7ICZuYnNw
OyAmbmJzcDsgc29ycnkgZm9yIGJvdGhlci4gYnV0IGkgcmVhbGx5IG5lZWQgc29tZSBoZWxwIHRv
IGRlYWwgd2l0aCBteSBwdXp6bGUuJm5ic3A7PG86cD48L286cD48L3NwYW4+PC9wPgo8L2Rpdj4K
PGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7
Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjayI+aSBh
bSBhIGZyZXNobWFuIHRvIEFNRCBHUFUgRHJpdmVyLCBOT1cgaSBhbSB0cnlpbmcgdG8gd3JpdGUg
YSBzaW1wbGUgZGVtbyB0byB1c2UgIi9kZXYva2ZkIiBhbmQgZG8gc29tZSZuYnNwOyB2cmFtIGFs
bG9jL2ZyZWUgdGVzdHMsJm5ic3A7IGJ1dCBpIGZvdW5kIHlvdSBtdXN0IGRvIHRoZSByaWdodAog
IkFNREtGRF9JT0NfQUNRVUlSRV9WTSIgaW9jdGwgY29tYW1uZCBiZWZvcmUgeW91IHRyeSBHUFUg
dG8gZG8gdnJhbSBhbGxvY2F0aW9uIGFuZCBvdGhlciB0aGluZ3MuJm5ic3A7IGZyb20gdGhlIGtm
ZCBkcml2ZXIgY29kZSx0aGUgcHJlLWNvbmRpdGlvbiB0byBkbyB0aGUgcmlnaHQgIkFNREtGRF9J
T0NfQUNRVUlSRV9WTSIgaXMgdG8gb2ZmZXIgYSAiL2Rldi9kcnYvcmVuZGVyMTI4IiBmZCZuYnNw
OyB0byB0aGUgcGFyYW1ldGVycy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2Pgo8ZGl2Pgo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZh
bWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90Oyxz
YW5zLXNlcmlmO2NvbG9yOmJsYWNrIj5zbywgd2h5IG5lZWQgdG8gZG8gdGhpcz8ga2ZkIGlzIHVz
ZWQgZm9yIGNvbXB1dGUsIGJ1dCAiL2Rldi9kcmkvcmVuZGVyMTI4IiBpcyBzcGVjaWZ5IHRvIGdm
eCB1c2FnZWQsIHdoeSBtdXN0IG9wZW4gdGhlICIvZGV2L2RyaS9yZW5kZXIxMjgiIGR1cmluZyB0
aGUgS0ZEIGNvbXB1dGUKIHNjZW5hcmlvPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPC9kaXY+Cjxk
aXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2Zv
bnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6YmxhY2siPnRoYW5r
cyBmb3IgeW91ciBraW5kbHkgaGVscCE8bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2Pgo8ZGl2
Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250
LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90
OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj5CUnM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2
Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVw
dDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj56
bGNhby48bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlh
bCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rp
dj4KPC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4=
------=_Part_132277_973737821.1709702722722--

