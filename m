Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5178449037
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389E96E030;
	Mon, 17 Jun 2019 19:47:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6506889FCE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:23 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so12318128qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OSFIIoJX3YWUHXOc+Qf98oSeMKPoF0qr/G7iBJpp95c=;
 b=miR348M1x9wwS+LvbDDjbZj0Znqk3ewYI9BtxdvaVPU6gjBhAqMAsAFBFimU4znLFQ
 idrOJigIk75W0gE3h0braIygjL+EyNtRiOz3aQZ/X31psHd9cUbZ8d94Snd3cI37H5tL
 JHQYIyqBGzSVqYrgZOzzRUxcbDstgCAKXBfpsJC/nPpwguO1QkZ3njE50U4urMr8UHqp
 TQIsQQ75DI03tqw9swD9aCs4hALMhycm3AkyOHe0jL7EC+l0q8xmbWOvl1o7Q5VUpt/y
 FCsNLMvMAcCmuCOaqqD7W2qpEFSuiQZaC0KDxjXZfVybovanfJrLmmvcK8voW5iwgImb
 HZOQ==
X-Gm-Message-State: APjAAAV6JKG72ZXG6Q4joB1QKfFwUcn7E6I602fFKrDUjU5r7fFk6HxK
 hhg4TrBVH2Egb77LLdf8DGymzjYq8yuWrw==
X-Google-Smtp-Source: APXvYqwUzI+SKwaIwcVmJ9GKdtC7Aq8SN9vW2L+6GXiZZxP+LtP4ipvwmJblf9froAyqktqZEmTnPA==
X-Received: by 2002:a0c:87bd:: with SMTP id 58mr23090576qvj.62.1560800842366; 
 Mon, 17 Jun 2019 12:47:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 386/459] drm/amd/display: Optimize bandwidth validation by
 adding early return
Date: Mon, 17 Jun 2019 14:45:27 -0500
Message-Id: <20190617194540.18497-87-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSFIIoJX3YWUHXOc+Qf98oSeMKPoF0qr/G7iBJpp95c=;
 b=nUlgfMpq5gPUYIOc033Z0fNEAYGhQIxoXl2KPTFSxLjofGbzQYWlakfp6Ciqoigfty
 1NKBvqKPOTHCARODMZZXNhTjViX1+Wlp1/zvF67hX5Aly2cNqbQ3rHDZGW5aI2GZPPHg
 Nhs2NQxtPEvtGuaT4zDxgf+VRpVKx2xF/SA2k8xVj8K1STgTMIyIe6LKxPdaY7HHpro3
 o4B3Z9RfH+ZLqwOHQycOqHTFQsL6YbC5D1zREcnpEcEk460D7DF1phU8zQRxr1UcI28q
 CYh6H6AOELNmHf8h/frCRXkemmTMm65NWRrJUqQR/sqZZO4r7I/dYVp7S9A/n8LmfUdv
 sC1A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Joshua Aberback <joshua.aberback@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCldlIGNhbiBz
cGxpdCB2YWxpZGF0aW9uIGludG8gdGhyZWUgcGFydHM6IGdldHRpbmcgdm9sdGFnZSBsZXZlbCwg
Z2V0dGluZwp3YXRlcm1hcmtzLCBhbmQgcnEvZGxnIGNhbGN1bGF0aW9ucy4gVGhlIHZvbHRhZ2Ug
bGV2ZWwgaXMgZW5vdWdoIHRvIGFuc3dlcgp0aGUgcXVlc3Rpb24gImRvIHdlIHN1cHBvcnQgdGhp
cyBzdGF0ZSIsIGFuZCB0aGUgcmVzdCBvZiBpdCBpcyB0byBkZXRlcm1pbmUKd2hhdCBoYXJkd2Fy
ZSBwcm9ncmFtbWluZyBpcyBuZWVkZWQgdG8gc3VwcG9ydCB0aGUgc3RhdGUuIE1vc3Qgb2YgdGhl
IGNhbGxzCnRvIHZhbGlkYXRlX2JhbmR3aWR0aCBvbmx5IGNhcmUgYWJvdXQgdGhlIGZpcnN0IHBh
cnQsIHNvIHdlIGFkZGVkIGFuIGVhcmx5CnJldHVybiBpbiB0aGF0IGNhc2UKClNpZ25lZC1vZmYt
Ynk6IEpvc2h1YSBBYmVyYmFjayA8am9zaHVhLmFiZXJiYWNrQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBM
YWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jICB8IDExICsrKy0tLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9od3NlcS5jICAgIHwgIDMgKy0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDM1ICsrKysrKysrKysrKysrLS0tLS0KIDMgZmls
ZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jCmluZGV4IGVmODA0
OTQ4Njk0ZS4uMzgzNjVkZDkxMWEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2FsY3MvZGNuX2NhbGNzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jCkBAIC0xMTE2LDkgKzExMTYsOCBAQCBib29sIGRjbl92
YWxpZGF0ZV9iYW5kd2lkdGgoCiAKIAkJY29udGV4dC0+YndfY3R4LmJ3LmRjbi5jbGsuZmNsa19r
aHogPSAoaW50KShid19jb25zdW1lZCAqIDEwMDAwMDAgLwogCQkJCShkZHI0X2RyYW1fZmFjdG9y
X3NpbmdsZV9DaGFubmVsICogdi0+bnVtYmVyX29mX2NoYW5uZWxzKSk7Ci0JCWlmIChid19jb25z
dW1lZCA9PSB2LT5mYWJyaWNfYW5kX2RyYW1fYmFuZHdpZHRoX3ZtaW4wcDY1KSB7CisJCWlmIChi
d19jb25zdW1lZCA9PSB2LT5mYWJyaWNfYW5kX2RyYW1fYmFuZHdpZHRoX3ZtaW4wcDY1KQogCQkJ
Y29udGV4dC0+YndfY3R4LmJ3LmRjbi5jbGsuZmNsa19raHogPSAoaW50KShid19jb25zdW1lZCAq
IDEwMDAwMDAgLyAzMik7Ci0JCX0KIAogCQljb250ZXh0LT5id19jdHguYncuZGNuLmNsay5kY2Zj
bGtfZGVlcF9zbGVlcF9raHogPSAoaW50KSh2LT5kY2ZfY2xrX2RlZXBfc2xlZXAgKiAxMDAwKTsK
IAkJY29udGV4dC0+YndfY3R4LmJ3LmRjbi5jbGsuZGNmY2xrX2toeiA9IChpbnQpKHYtPmRjZmNs
ayAqIDEwMDApOwpAQCAtMTEzMyw3ICsxMTMyLDggQEAgYm9vbCBkY25fdmFsaWRhdGVfYmFuZHdp
ZHRoKAogCQkJCQlkYy0+ZGVidWcubWluX2Rpc3BfY2xrX2toejsKIAkJfQogCi0JCWNvbnRleHQt
PmJ3X2N0eC5idy5kY24uY2xrLmRwcGNsa19raHogPSBjb250ZXh0LT5id19jdHguYncuZGNuLmNs
ay5kaXNwY2xrX2toeiAvIHYtPmRpc3BjbGtfZHBwY2xrX3JhdGlvOworCQljb250ZXh0LT5id19j
dHguYncuZGNuLmNsay5kcHBjbGtfa2h6ID0gY29udGV4dC0+YndfY3R4LmJ3LmRjbi5jbGsuZGlz
cGNsa19raHogLworCQkJCXYtPmRpc3BjbGtfZHBwY2xrX3JhdGlvOwogCQljb250ZXh0LT5id19j
dHguYncuZGNuLmNsay5waHljbGtfa2h6ID0gdi0+cGh5Y2xrX3Blcl9zdGF0ZVt2LT52b2x0YWdl
X2xldmVsXTsKIAkJc3dpdGNoICh2LT52b2x0YWdlX2xldmVsKSB7CiAJCWNhc2UgMDoKQEAgLTEy
MjAsOSArMTIyMCw3IEBAIGJvb2wgZGNuX3ZhbGlkYXRlX2JhbmR3aWR0aCgKIAkJCQkJCS8qIHBp
cGUgbm90IHNwbGl0IHByZXZpb3VzbHkgbmVlZHMgc3BsaXQgKi8KIAkJCQkJCWhzcGxpdF9waXBl
ID0gZmluZF9pZGxlX3NlY29uZGFyeV9waXBlKCZjb250ZXh0LT5yZXNfY3R4LCBwb29sLCBwaXBl
KTsKIAkJCQkJCUFTU0VSVChoc3BsaXRfcGlwZSk7Ci0JCQkJCQlzcGxpdF9zdHJlYW1fYWNyb3Nz
X3BpcGVzKAotCQkJCQkJCSZjb250ZXh0LT5yZXNfY3R4LCBwb29sLAotCQkJCQkJCXBpcGUsIGhz
cGxpdF9waXBlKTsKKwkJCQkJCXNwbGl0X3N0cmVhbV9hY3Jvc3NfcGlwZXMoJmNvbnRleHQtPnJl
c19jdHgsIHBvb2wsIHBpcGUsIGhzcGxpdF9waXBlKTsKIAkJCQkJfQogCiAJCQkJCWRjbl9id19j
YWxjX3JxX2RsZ190dHUoZGMsIHYsIGhzcGxpdF9waXBlLCBpbnB1dF9pZHgpOwpAQCAtMTI1Myw3
ICsxMjUxLDYgQEAgYm9vbCBkY25fdmFsaWRhdGVfYmFuZHdpZHRoKAogCX0KIAogCWlmICh2LT52
b2x0YWdlX2xldmVsID09IDApIHsKLQogCQljb250ZXh0LT5id19jdHguZG1sLnNvYy5zcl9lbnRl
cl9wbHVzX2V4aXRfdGltZV91cyA9CiAJCQkJZGMtPmRjbl9zb2MtPnNyX2VudGVyX3BsdXNfZXhp
dF90aW1lOwogCQljb250ZXh0LT5id19jdHguZG1sLnNvYy5zcl9leGl0X3RpbWVfdXMgPSBkYy0+
ZGNuX3NvYy0+c3JfZXhpdF90aW1lOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCA1NDJmMTQ0ZjgwN2YuLmRjMzRjZTI4NTA1
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h3c2VxLmMKQEAgLTE0MTUsOSArMTQxNSw4IEBAIGJvb2wgZGNuMjBfdXBkYXRlX2JhbmR3aWR0
aCgKIAlpbnQgaTsKIAogCS8qIHJlY2FsY3VsYXRlIERNTCBwYXJhbWV0ZXJzICovCi0JaWYgKCFk
Yy0+cmVzX3Bvb2wtPmZ1bmNzLT52YWxpZGF0ZV9iYW5kd2lkdGgoZGMsIGNvbnRleHQsIGZhbHNl
KSkgeworCWlmICghZGMtPnJlc19wb29sLT5mdW5jcy0+dmFsaWRhdGVfYmFuZHdpZHRoKGRjLCBj
b250ZXh0LCBmYWxzZSkpCiAJCXJldHVybiBmYWxzZTsKLQl9CiAKIAkvKiBhcHBseSB1cGRhdGVk
IGJhbmR3aWR0aCBwYXJhbWV0ZXJzICovCiAJZGMtPmh3c3MucHJlcGFyZV9iYW5kd2lkdGgoZGMs
IGNvbnRleHQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBlM2NkM2UzZGIyYzQuLjM3MWQ5NjI5MGQ4NiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmMKQEAgLTE5MDcsMTAgKzE5MDcsMTEgQEAgc3RhdGljIGJvb2wgZGNuMjBfdmFsaWRh
dGVfZHNjKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqbmV3X2N0eCkKIH0KICNlbmRp
ZgogCi1ib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRjLAotCQkJICAg
ICAgc3RydWN0IGRjX3N0YXRlICpjb250ZXh0LAotCQkJICAgICAgYm9vbCBmYXN0X3ZhbGlkYXRl
KQorYm9vbCBkY24yMF92YWxpZGF0ZV9iYW5kd2lkdGgoc3RydWN0IGRjICpkYywgc3RydWN0IGRj
X3N0YXRlICpjb250ZXh0LAorCQlib29sIGZhc3RfdmFsaWRhdGUpCiB7CisJYm9vbCBvdXQgPSBm
YWxzZTsKKwogCWludCBwaXBlX2NudCwgaSwgcGlwZV9pZHgsIHZsZXZlbCwgdmxldmVsX3Vuc3Bs
aXQ7CiAJaW50IHBpcGVfc3BsaXRfZnJvbVtNQVhfUElQRVNdOwogCWJvb2wgb2RtX2NhcGFibGUg
PSBjb250ZXh0LT5id19jdHguZG1sLmlwLm9kbV9jYXBhYmxlOwpAQCAtMTk1NCwxMSArMTk1NSwx
NiBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRjLAogCX0KIAog
CXBpcGVfY250ID0gZGNuMjBfcG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29udGV4dChkYywgJmNv
bnRleHQtPnJlc19jdHgsIHBpcGVzKTsKLQlpZiAoIXBpcGVfY250KQotCQlnb3RvIHZhbGlkYXRl
X3Bhc3M7CisKKwlpZiAoIXBpcGVfY250KSB7CisJCW91dCA9IHRydWU7CisJCWdvdG8gdmFsaWRh
dGVfb3V0OworCX0KIAogCWNvbnRleHQtPmJ3X2N0eC5kbWwuaXAub2RtX2NhcGFibGUgPSAwOwor
CiAJdmxldmVsID0gZG1sX2dldF92b2x0YWdlX2xldmVsKCZjb250ZXh0LT5id19jdHguZG1sLCBw
aXBlcywgcGlwZV9jbnQpOworCiAJY29udGV4dC0+YndfY3R4LmRtbC5pcC5vZG1fY2FwYWJsZSA9
IG9kbV9jYXBhYmxlOwogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKQEAg
LTIxMTEsNiArMjExNywxMSBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3Qg
ZGMgKmRjLAogCX0KICNlbmRpZgogCisJaWYgKGZhc3RfdmFsaWRhdGUpIHsKKwkJb3V0ID0gdHJ1
ZTsKKwkJZ290byB2YWxpZGF0ZV9vdXQ7CisJfQorCiAJZm9yIChpID0gMCwgcGlwZV9pZHggPSAw
LCBwaXBlX2NudCA9IDA7IGkgPCBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkrKykgewogCQlp
ZiAoIWNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0uc3RyZWFtKQogCQkJY29udGludWU7CkBA
IC0yMjM1LDIxICsyMjQ2LDI3IEBAIGJvb2wgZGNuMjBfdmFsaWRhdGVfYmFuZHdpZHRoKHN0cnVj
dCBkYyAqZGMsCiAJCQkJcGlwZV9pZHgsCiAJCQkJY3N0YXRlX2VuLAogCQkJCWNvbnRleHQtPmJ3
X2N0eC5idy5kY24uY2xrLnBfc3RhdGVfY2hhbmdlX3N1cHBvcnQpOworCiAJCWNvbnRleHQtPmJ3
X2N0eC5kbWwuZnVuY3MucnFfZGxnX2dldF9ycV9yZWcoJmNvbnRleHQtPmJ3X2N0eC5kbWwsCiAJ
CQkJJmNvbnRleHQtPnJlc19jdHgucGlwZV9jdHhbaV0ucnFfcmVncywKIAkJCQlwaXBlc1twaXBl
X2lkeF0ucGlwZSk7CisKIAkJcGlwZV9pZHgrKzsKIAl9CiAKLXZhbGlkYXRlX3Bhc3M6Ci0Ja2Zy
ZWUocGlwZXMpOwotCXJldHVybiB0cnVlOworCW91dCA9IHRydWU7CisJZ290byB2YWxpZGF0ZV9v
dXQ7CiAKIHZhbGlkYXRlX2ZhaWw6CiAJRENfTE9HX1dBUk5JTkcoIk1vZGUgVmFsaWRhdGlvbiBX
YXJuaW5nOiAlcyBmYWlsZWQgdmFsaWRhdGlvbi5cbiIsCiAJCWRtbF9nZXRfc3RhdHVzX21lc3Nh
Z2UoY29udGV4dC0+YndfY3R4LmRtbC52YmEuVmFsaWRhdGlvblN0YXR1c1tjb250ZXh0LT5id19j
dHguZG1sLnZiYS5zb2MubnVtX3N0YXRlc10pKTsKKworCW91dCA9IGZhbHNlOworCit2YWxpZGF0
ZV9vdXQ6CiAJa2ZyZWUocGlwZXMpOwotCXJldHVybiBmYWxzZTsKKworCXJldHVybiBvdXQ7CiB9
CiAKIHN0cnVjdCBwaXBlX2N0eCAqZGNuMjBfYWNxdWlyZV9pZGxlX3BpcGVfZm9yX2xheWVyKAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
