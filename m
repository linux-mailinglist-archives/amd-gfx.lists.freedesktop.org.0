Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AB484E3
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 16:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45AF89259;
	Mon, 17 Jun 2019 14:07:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDF489226
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:39:40 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.164.208]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M40jS-1iT1x50Ogs-00rWe3; Mon, 17
 Jun 2019 14:34:17 +0200
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Evan Quan
 <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/amd/powerplay: Delete a redundant memory setting in
 vega20_set_default_od8_setttings()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <de3f6a5e-8ac4-bc8e-0d0c-3a4a5db283e9@web.de>
Date: Mon, 17 Jun 2019 14:34:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:6q8YryJyEBQzQL6cr5Dg8HDdKYlBxXGEzN8mpWdY2YzSa+nzMoF
 71tn1IqfXL+eG+IOZqRL4SmXd5pQPumVjCEB+gjFhOVzTgcDj5bCO20lHTppQHBkpAOOrmi
 WlY4a3qXMZCyAULoiQ6Urx5DkYZnO7zW57jr5YoPIQ8z4izIGMf2FuI9KNyRGFAJCz5mCeV
 g6HI7YkWddqMmWZXpq6Lg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4J1OGQDnryc=:XeRWNyfLs3lZlGlS8vtgeg
 C24mWTlibYF2NEwqQgNDkcLgedtdOz2lHGUiYkp42JLj3fD4wU12TCUqHPWDurfPZNHGeIvWb
 5/6Cg/y4RMprx2PFIJatU9gVxYJLHgdOeX+U1jfL/ce9GOZJ/eocLxcHbgGD+29ILd91/0G6g
 vebjJ3c1MnuB6eoB7fmE2Icx3qZU7xXyQjYmMZFoywajjZ6sFl7HY53/5hWK8K3pcnmx854US
 HHRWUzCgeADsbfNYZJfaZYaT74V+LQP/uHj+qnTWBpXy4oZFPDuGf+8gtYdDGPq6tTW3pY8ir
 iaYbczZAxYPXDob9QMMP70IfSPoupAzS9f19G0jynwQzkV0HpsiuIo0sh3o0QAis73Og5FGEf
 WPZsxKuvYLAOXNuiruo489x8ifSp0cOwhM68n8kBRYs+j0Bo+G4l+0j0iFynD1XqVErgHSed+
 36WxXjNMamO2hPRVGenHku9vJmt9su525FxtwLPScQ43j8srjhuYL14Bch6zrBfB6HTuYWSis
 n9GCtiB+t/H2e7TCrneZ9HWtC8OH4hbOGpVWxVLLfG1QZXR+0Am1HYsFKepYU83GiqSu9fA1d
 aj+jZH1vPtFRPNOemqnDPps9SF+MRUSWcCP8FFZMwBpWG5J4YatSHdPvkv6XEuJY+ayeXtOEt
 LeFZIhgKg+KMaeo2s4ltBgJ4tFtYqKOi0x6VKUZ4VqLo4A2leTTAybvA6b/E7/ShTDUQMzNL2
 xShxcoDfvZTFez7pYWTAApzJPNVqd0aBSaE4IRBXZPn/m5rU4u742JC/EXiu0C1TyIZXpR5DI
 IrZISWZHr79mVDT7sWEXIVm09oG/g+qCe7+O71Qk+Vg/mD04ZcBoTzjVOniZoaCiltcaFTl9B
 C93hD7pKUuVyLnyAkIckKhE4Ud01sBVbiCy7i/Oz8W16Bk8xYiFKv63+xJHfyeaYLj5xQvDyE
 scsoXeq3rACmXfOVjdwCquUfnJABZlYjfvuDR0Ncmri4N1LmIceq9
X-Mailman-Approved-At: Mon, 17 Jun 2019 14:07:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1560775178;
 bh=7of0paGiux2QgmNkMVygVoiS/Aku0RdePBQPrJ+O2kk=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=jf/aZb5l6BZf8Sbacg95zp3PwaSfzULz6Tyepfwzry3nQDE/pKSeOZ1g1qFfvPGpV
 ot9hfI1rCo06qmBCM5emftKaL6dkFXB7+JRV41NtHr4Q+nRqbpQ835q8xm4DehWN6s
 IYkdFaSifLn99h4S6GNglOBSfspPPif5gl7Mk9ak=
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
OiBNb24sIDE3IEp1biAyMDE5IDE0OjI0OjE0ICswMjAwCgpUaGUgbWVtb3J5IHdhcyBzZXQgdG8g
emVybyBhbHJlYWR5IGJ5IGEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCca3phbGxvY+KAnS4KVGh1
cyByZW1vdmUgYW4gZXh0cmEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCcbWVtc2V04oCdIGZvciB0
aGlzIHB1cnBvc2UuCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2lu
ZWxsZSBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVz
ZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92
ZWdhMjBfcHB0LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCmluZGV4IDRhYThmNWE2OWM0Yy4u
NjI0OTdhZDY2YTM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92
ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3Bw
dC5jCkBAIC0xMjk1LDcgKzEyOTUsNiBAQCBzdGF0aWMgaW50IHZlZ2EyMF9zZXRfZGVmYXVsdF9v
ZDhfc2V0dHRpbmdzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCWlmICghdGFibGVfY29udGV4
dC0+b2Q4X3NldHRpbmdzKQogCQlyZXR1cm4gLUVOT01FTTsKCi0JbWVtc2V0KHRhYmxlX2NvbnRl
eHQtPm9kOF9zZXR0aW5ncywgMCwgc2l6ZW9mKHN0cnVjdCB2ZWdhMjBfb2Q4X3NldHRpbmdzKSk7
CiAJb2Q4X3NldHRpbmdzID0gKHN0cnVjdCB2ZWdhMjBfb2Q4X3NldHRpbmdzICopdGFibGVfY29u
dGV4dC0+b2Q4X3NldHRpbmdzOwoKIAlpZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIEZF
QVRVUkVfRFBNX1NPQ0NMS19CSVQpKSB7Ci0tCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
