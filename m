Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC60484E2
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 16:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ECC89256;
	Mon, 17 Jun 2019 14:07:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1182 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2019 12:35:33 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A4A89022
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:35:33 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.164.208]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LopMx-1iHhfD2r7b-00gtNY; Mon, 17
 Jun 2019 14:10:12 +0200
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 David Francis <David.Francis@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/amd/display: Delete a redundant memory setting in
 amdgpu_dm_irq_register_interrupt()
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3900e9c8-4905-1704-686d-90ccf3b00a88@web.de>
Date: Mon, 17 Jun 2019 14:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:gINRoyvJBwA0izvAsysZLEiAXPyc0PdK7XoWn/NowK86RvwMyOB
 CDcFSV0P3DUUQmM4Fcv2MU5A8vQ10pKfKw9Pa/u0V68halCVosCNq746NnxQqiaqWzbLxDQ
 bSeCbhoRexPtceXKYDQosgcEUzltxy/McyIqVP96TZtbM6UVk1dUaYAlz9mImpmY0sstTDv
 /IlwrJ03OZcDRZ/eltzxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cFJc4wRgbFU=:g1x33drppnblHCDh61H1mM
 oVYo5R7vSGNhkvrC/eGc546Ahact7C/uy/wtqSOR4muneAKwU9kgxwUlLC5rqCehzq8GTZAS0
 fniZ3IpDfaHzkGwzK/ifqKGKSKGY8qCEOXYN+XcNfFXQOthe+lNWenPU+khglipkSx6KE9o26
 wU1BVY85bnHsZlgvzRSxCLZn+suVsXED2v/+1p3PohdvX88QmYMLxkIUVC0I1Byy6bebkmEtn
 RtBjdWkbO9YKqSJtlHxIJbJY3yRJFazpgzv4zNwumZt1H+USrpbDHe/tz7DGhTQDpDv3uvvhr
 Ug4+XOMwrlg+UYWY8UvzJB6FMYu1LVWns1hR4A75eYjdf+fdI/tTnKfepinZ8fCir4k5Dg5np
 vDseZW5idsPWKesElWdKtk1mu5SM2RrvzObGCVi2rAj9sD7u5Mbf1hEk4MvQGwJ1F64YJBS++
 ZiLsY8dlw3aL40n02/VtVk/6ytdJ0Pp9JLRTuqIQFr/F58IQpwwuGIfatjwBtX7W4fGMtbghx
 i28UCNdz0FpDU2j33cgomhHVD88wDIgvtRjv7LxE8Ocl1zXZVqgBLO3w4Q21Nja2CQ3O9W59O
 jhoSTxl6UvbBbfUyLDSaih30o0cxs4tM30Wy45ovH7ToCGUwUSVYI7Tf3VK5JdP0xuoqkOCrQ
 kPFsDupK5MXUB/jDFCfvvtq2OrR8djfHhYg78KCKTcIwoG04uuxM3ZZSaFzNwtcnutuvETaVG
 wrw9xqFt37ujkckKA1e46tsc1gEtYWKCW45YEsKSsjIEs4x3e2wxHTzY2Jn2pHTuc8boX8BaE
 Ay5yuDdYSnf5N6hoD8X98kyzi1zTjyCFd0LlwmyTggyvl3BiNvpRSKbr49aie8bQS4+oNMCfy
 wwV2Xpkqfuep4VTU9WLCcn0S5tkgBjyIPhOCpYSz/vQp8D1H6DJQb6+nxBgRBGV3PcfomM8Em
 blNVO4Ae0KIufyBSIeT76Ca0+CnoUx+8srSncABMpSgikeN0FuHWH
X-Mailman-Approved-At: Mon, 17 Jun 2019 14:07:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1560774932;
 bh=mlYu8JItkzkaUEYK3B9di0oUcsYk/xS6Vlr7z6Eo05s=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=qZa2FEz9kILctoeAvgaQegZ0uQjesip3X7D2NeTTQO80Lyvp0gTgxro/UFmNI+fj0
 8mQ8qDlFufvkeIj4ojlsummy7P8rV2eAVGAY78yhaSIBd9YsFbVxQwpeuSrZf1f1v/
 fx1FhP/jv735rpZhbGqWjQ3yrJLe09QEbu5/RBAE=
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
OiBNb24sIDE3IEp1biAyMDE5IDEzOjU2OjM5ICswMjAwCgpUaGUgbWVtb3J5IHdhcyBzZXQgdG8g
emVybyBhbHJlYWR5IGJ5IGEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCca3phbGxvY+KAnS4KVGh1
cyByZW1vdmUgYW4gZXh0cmEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCcbWVtc2V04oCdIGZvciB0
aGlzIHB1cnBvc2UuCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2lu
ZWxsZSBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVz
ZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbV9pcnEuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1faXJxLmMKaW5kZXggMWI1OWQzZDQyZjdiLi5mYTVkNTAzZDM3OWMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2lycS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2ly
cS5jCkBAIC0yNzcsOCArMjc3LDYgQEAgdm9pZCAqYW1kZ3B1X2RtX2lycV9yZWdpc3Rlcl9pbnRl
cnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCXJldHVybiBEQUxfSU5WQUxJRF9J
UlFfSEFORExFUl9JRFg7CiAJfQoKLQltZW1zZXQoaGFuZGxlcl9kYXRhLCAwLCBzaXplb2YoKmhh
bmRsZXJfZGF0YSkpOwotCiAJaW5pdF9oYW5kbGVyX2NvbW1vbl9kYXRhKGhhbmRsZXJfZGF0YSwg
aWgsIGhhbmRsZXJfYXJncywgJmFkZXYtPmRtKTsKCiAJaXJxX3NvdXJjZSA9IGludF9wYXJhbXMt
PmlycV9zb3VyY2U7Ci0tCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
