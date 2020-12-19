Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E232DF529
	for <lists+amd-gfx@lfdr.de>; Sun, 20 Dec 2020 12:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C4B6E171;
	Sun, 20 Dec 2020 11:10:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 575 seconds by postgrey-1.36 at gabe;
 Sat, 19 Dec 2020 17:54:11 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3B58996E
 for <amd-gfx@lists.freedesktop.org>; Sat, 19 Dec 2020 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1608400449;
 bh=qSwtXCVRwWZNBlI00yBuYouvdhL88ki0NEEUrGgltaw=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=eNCxlFz/kS2PzAwlV55lBHpwPk0FACtIOUY4hHlDFowBwm0TfEW0liHOdivhpVCn2
 YXVoaM/IWVm4W3LJxn3Bj+eqDMP6YTr0xQeCnJ4dfK2TblDFn1tz0EBnCC1ajOH7fp
 zJ0MjQbG1uEEpgz6vPDMn59S3qT5gWK++FgdrHpo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.88.127]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrbz-1kh5VV3QP7-00RqpZ; Sat, 19
 Dec 2020 18:46:32 +0100
Subject: [PATCH 1/2] drm/amd/display: Return directly after a failed kzalloc()
 in dc_create()
From: Markus Elfring <Markus.Elfring@web.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Chiawen Huang <chiawen.huang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
References: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
Message-ID: <7a9d62c6-b3f5-d185-3436-2cbc08ff1253@web.de>
Date: Sat, 19 Dec 2020 18:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <98e71ee7-1eb9-ada8-a438-703be03e96d1@web.de>
Content-Language: en-GB
X-Provags-ID: V03:K1:4yZu6FSOWkLJv/B/Ig5QqaREmU0Ue8I+cQk8prFvLKR/zMsx8F8
 TyQKoIjRZoZov+T9U4aKT/tGUZppL1z6pHq9RsXU85cCrCBZLvhYBZX+ldrgauB8/jbQZ1G
 F51IbBz2KBsiWWJqXOWHAtQH5zty+w94/lMltDtVXG8SokX5wQ/bHDplvLDrsZo9STqFIy6
 wxDjZTjeuiTXuch3sXpnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7H8x4C2tlkk=:mLfPseeqv6TLt5GHCQ/w3O
 B8Mw2LvSgK/+fayxJB1qiwMu7Xfsxpt9MdXsJomyg7ekTvlpM4Tf0CQAJKffLrKjt1J1f3C4H
 GktiskfrUTbvsFeSJNboZiJiLHoRGF/v6rDMKvX9mmhUf5dXNaATFcoFsukjLd6i8aGgPbsAO
 W5D21hka8uJyW7q+3hq6WU108nmBEKJKo+0fgmhu9Qv4c4450T4mbCtm/4IXd6OSpl5lqJ71n
 OxOCdHKIVn134G6qZPluRm0F4vFD7Tu+rKETHfLVs6ZmqWeFoF8D2lQFGmbhlsUB4G3tKVwZR
 Tu8LaK11FiR19B28OEYu4pcORhNj5jl5ld2PXzsrRSL+3KMG6Hmf4u+GbM5I9UzjQNfBmujPC
 5ojvPfhC/K9gj7M+tPmUxI65rUXyalXkkYyvWSym9MvfWTCilg9vxYw2U3nHtdKcj+XxKau/z
 E+z2XpovPzqR7N3FEE5bKEkU5L+VTJ6jARqlrVsNrsEQNW5e4c3Q3C4CzsNJok147xKlcN8Oy
 wTUAYHho4ojQX0tp2iYAKUosd+fPX3L5iMkPF18B4vCGQE4awOgG/6bhhgb+jfe0CM8DMY3pu
 bSohbLGAzL6aDW32tXj2OzkAgc5LvOiuGsLNuRi+MElbPWIWu6CS3tGfyOSSnYV0TAYAGZ0E5
 QOb9qEiuDcGIpU2c5MC5qNm4puy7Ju+0gAxdow7m3LGka1x3uYQKPTLmU7Bgr1rrWi2Ox1SOd
 zxlp/O+kh7Ci943JzOuNKDtO3eBYR2TSI72nesFV77tk+TLKmYbBwM8079UkYVdZWJFb0Wxdj
 V3X/AVVQ2gdAquJRoQk1yG3qZwURT25fqqFheNOzVcn/KjH3sUSVZwx1yJWIjf4AhEUvAS2Ad
 1wrjgCtguKMwQ/lXF5cw==
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:28 +0000
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDE5IERlYyAyMDIwIDE4OjA0OjMzICswMTAwCgoqIFJldHVybiBkaXJlY3RseSBhZnRl
ciBhIGNhbGwgb2YgdGhlIGZ1bmN0aW9uIOKAnGt6YWxsb2PigJ0gZmFpbGVkCiAgYXQgdGhlIGJl
Z2lubmluZy4KCiogRGVsZXRlIGEgbGFiZWwgd2hpY2ggYmVjYW1lIHVubmVjZXNzYXJ5IHdpdGgg
dGhpcyByZWZhY3RvcmluZy4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5n
QHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMK
aW5kZXggNzMzOWQ5ODU1ZWM4Li5lMzVmYmZjYjRkMGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGMuYwpAQCAtOTY0LDggKzk2NCw4IEBAIHN0cnVjdCBkYyAqZGNfY3Jl
YXRlKGNvbnN0IHN0cnVjdCBkY19pbml0X2RhdGEgKmluaXRfcGFyYW1zKQogCXN0cnVjdCBkYyAq
ZGMgPSBremFsbG9jKHNpemVvZigqZGMpLCBHRlBfS0VSTkVMKTsKIAl1bnNpZ25lZCBpbnQgZnVs
bF9waXBlX2NvdW50OwoKLQlpZiAoTlVMTCA9PSBkYykKLQkJZ290byBhbGxvY19mYWlsOworCWlm
ICghZGMpCisJCXJldHVybiBOVUxMOwoKIAlpZiAoaW5pdF9wYXJhbXMtPmRjZV9lbnZpcm9ubWVu
dCA9PSBEQ0VfRU5WX1ZJUlRVQUxfSFcpIHsKIAkJaWYgKGZhbHNlID09IGRjX2NvbnN0cnVjdF9j
dHgoZGMsIGluaXRfcGFyYW1zKSkgewpAQCAtMTAwOSw4ICsxMDA5LDYgQEAgc3RydWN0IGRjICpk
Y19jcmVhdGUoY29uc3Qgc3RydWN0IGRjX2luaXRfZGF0YSAqaW5pdF9wYXJhbXMpCgogY29uc3Ry
dWN0X2ZhaWw6CiAJa2ZyZWUoZGMpOwotCi1hbGxvY19mYWlsOgogCXJldHVybiBOVUxMOwogfQoK
LS0KMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
