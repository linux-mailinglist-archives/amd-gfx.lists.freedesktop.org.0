Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA232EFA11
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Jan 2021 22:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7FD6E8E3;
	Fri,  8 Jan 2021 21:15:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC38F6E8DE;
 Fri,  8 Jan 2021 21:15:44 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id q25so11037856otn.10;
 Fri, 08 Jan 2021 13:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RdHU0V+l/5mQjoD9Rkq0FokpPahQQiZHJdwaPeqIFOw=;
 b=N/9q3tnXNvoXj9NNSpNsp/WqUeWVnlXZmfdK5XKDodktfsDUrcKtMMoGr3+ipiy+kJ
 LSIfJyZzXDXtETPGIqnqGxqqHpxB9795RthL27QqsKOxtHlej07Jxk+VIk02x2vd5hLJ
 te5c3x9ZnSsi4p3D4P/7sBKCCs2vt2qB8JSpQiaJa0FoKFMLS+4/Hyla3wFQ6nKjBGuc
 oWwf64peHkELSW1QZsJRj+JSDPUuNtgOdYtDy1whEUtvKRbxmLJTLlY5EfEugO4y/awo
 8RjDEf2IScxGiMTzkQXE4agUt3YLLGoMaCW9jB+VtO5/0827gEWrmQQimdkjHRu1iwBZ
 sMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RdHU0V+l/5mQjoD9Rkq0FokpPahQQiZHJdwaPeqIFOw=;
 b=opJMv+0nHhWyskFBSHx3VorIHILzfM28NYGgiHNj0r15ftdONI6+YiwbawNtInMBld
 vYC1NeEIoAfOlPrGRXUtv0z/p9Y4T07TesU+9Y53QFKnvWVH9cOlbBuSIjtr3ZInHKAa
 bqGfjxg51ydhDuOb2s6fgf2g+kUdju46t2T4xX7r9ThgtcBe56xas/nIx2bSI3A09IxN
 zSTw4KxhsgqEKEc8YS99Cm/pU4McbhXEAcyR2R+Se+jAsRpPI8JHNwTwhTdwQblgmGPK
 enkzI7ZFEvw7+GIKEKl2KF2+KmvCD646oRcgRuwCxC7dr8IPIkNgyUqtik+d7j0CJgNo
 ZN0w==
X-Gm-Message-State: AOAM532CpmSQmVszXvjN+0BOQPMf8wAEo1jkSvuigA5Td7k/b10ArdI+
 80NVFxV6Os0jEFkBQuQuDzj1hqH6fhJBquYDVwtMnPGK
X-Google-Smtp-Source: ABdhPJxUgRAka2RPKA+U8s8ytzVCIDZKjm/nFhiLdVPVHrGZ4YUvczYtQ+lBCAP0taI+zW0Tsik0GJrHRn2GsSUX9Zg=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr4083848ote.132.1610140544373; 
 Fri, 08 Jan 2021 13:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-28-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-28-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 16:15:33 -0500
Message-ID: <CADnq5_P=6PbbOLYE6PiXP1_J9weqZgrKRwGU3Q7ZsRnx7BX2eA@mail.gmail.com>
Subject: Re: [PATCH 27/40] drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Fix worthy
 function headers, demote barely documented one
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5
L2h3bWdyL3ZlZ2ExMF9od21nci5jOjE1NTY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2FjZ19mcmVxJyBub3QgZGVzY3JpYmVkIGluICd2ZWdhMTBfcG9wdWxhdGVfc2lu
Z2xlX2dmeF9sZXZlbCcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJw
bGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOjE2MjE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ2N1cnJlbnRfc29jX2RpZCcgbm90IGRlc2NyaWJlZCBpbiAndmVnYTEwX3Bv
cHVsYXRlX3NpbmdsZV9zb2NfbGV2ZWwnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYzoxNjIxOiB3YXJuaW5nOiBGdW5jdGlv
biBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjdXJyZW50X3ZvbF9pbmRleCcgbm90IGRlc2NyaWJlZCBp
biAndmVnYTEwX3BvcHVsYXRlX3NpbmdsZV9zb2NfbGV2ZWwnCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYzoxNjIxOiB3YXJu
aW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdjdXJyZW50X3NvY2Nsa19sZXZlbCcgZGVz
Y3JpcHRpb24gaW4gJ3ZlZ2ExMF9wb3B1bGF0ZV9zaW5nbGVfc29jX2xldmVsJwo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmM6
MTc1Nzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnY3VycmVudF9tZW1f
dmlkJyBub3QgZGVzY3JpYmVkIGluICd2ZWdhMTBfcG9wdWxhdGVfc2luZ2xlX21lbW9yeV9sZXZl
bCcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3Zl
Z2ExMF9od21nci5jOjE3NTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIg
J2N1cnJlbnRfbWVtY2xrX2xldmVsJyBub3QgZGVzY3JpYmVkIGluICd2ZWdhMTBfcG9wdWxhdGVf
c2luZ2xlX21lbW9yeV9sZXZlbCcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0v
cG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOjE3NTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2N1cnJlbnRfbWVtX3NvY192aW5kJyBub3QgZGVzY3JpYmVkIGlu
ICd2ZWdhMTBfcG9wdWxhdGVfc2luZ2xlX21lbW9yeV9sZXZlbCcKPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jOjI4NzE6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2JpdG1hcCcgbm90IGRlc2NyaWJl
ZCBpbiAndmVnYTEwX3N0YXJ0X2RwbScKPgo+IENjOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jIHwgMTAg
KysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3
bWdyL3ZlZ2ExMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdt
Z3IvdmVnYTEwX2h3bWdyLmMKPiBpbmRleCBkYTQ3MDQ2MmQ2ZTJjLi4yOWM5OTY0MmQyMmQ0IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ex
MF9od21nci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTEwX2h3bWdyLmMKPiBAQCAtMTU0OSw2ICsxNTQ5LDcgQEAgc3RhdGljIGludCB2ZWdhMTBf
cG9wdWxhdGVfc21jX2xpbmtfbGV2ZWxzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCj4gICAqIEBo
d21ncjogICAgICB0aGUgYWRkcmVzcyBvZiB0aGUgaGFyZHdhcmUgbWFuYWdlcgo+ICAgKiBAZ2Z4
X2Nsb2NrOiAgdGhlIEdGWCBjbG9jayB0byB1c2UgdG8gcG9wdWxhdGUgdGhlIHN0cnVjdHVyZS4K
PiAgICogQGN1cnJlbnRfZ2Z4Y2xrX2xldmVsOiAgbG9jYXRpb24gaW4gUFBUYWJsZSBmb3IgdGhl
IFNNQyBHRlhDTEsgc3RydWN0dXJlLgo+ICsgKiBAYWNnX2ZyZXE6ICAgQUNHIGZyZXF1ZW50eSB0
byByZXR1cm4gKE1IeikKPiAgICovCj4gIHN0YXRpYyBpbnQgdmVnYTEwX3BvcHVsYXRlX3Npbmds
ZV9nZnhfbGV2ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwKPiAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgZ2Z4X2Nsb2NrLCBQbGxTZXR0aW5nX3QgKmN1cnJlbnRfZ2Z4Y2xrX2xldmVsLAo+IEBA
IC0xNjEyLDcgKzE2MTMsOCBAQCBzdGF0aWMgaW50IHZlZ2ExMF9wb3B1bGF0ZV9zaW5nbGVfZ2Z4
X2xldmVsKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCj4gICAqCj4gICAqIEBod21ncjogICAgIHRo
ZSBhZGRyZXNzIG9mIHRoZSBoYXJkd2FyZSBtYW5hZ2VyLgo+ICAgKiBAc29jX2Nsb2NrOiB0aGUg
U09DIGNsb2NrIHRvIHVzZSB0byBwb3B1bGF0ZSB0aGUgc3RydWN0dXJlLgo+IC0gKiBAY3VycmVu
dF9zb2NjbGtfbGV2ZWw6IGxvY2F0aW9uIGluIFBQVGFibGUgZm9yIHRoZSBTTUMgU09DQ0xLIHN0
cnVjdHVyZS4KPiArICogQGN1cnJlbnRfc29jX2RpZDogICBERlMgZGl2aWRlciB0byBwYXNzIGJh
Y2sgdG8gY2FsbGVyCj4gKyAqIEBjdXJyZW50X3ZvbF9pbmRleDogaW5kZXggb2YgY3VycmVudCBW
REQgdG8gcGFzcyBiYWNrIHRvIGNhbGxlcgo+ICAgKiByZXR1cm46ICAgICAgMCBvbiBzdWNjZXNz
Cj4gICAqLwo+ICBzdGF0aWMgaW50IHZlZ2ExMF9wb3B1bGF0ZV9zaW5nbGVfc29jX2xldmVsKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IsCj4gQEAgLTE3NDQsNyArMTc0Niw3IEBAIHN0YXRpYyB2b2lk
IHZlZ2ExMF9wb3B1bGF0ZV92ZGRjX3NvY19sZXZlbHMoc3RydWN0IHBwX2h3bWdyICpod21ncikK
PiAgICAgICAgIH0KPiAgfQo+Cj4gLS8qKgo+ICsvKgo+ICAgKiBQb3B1bGF0ZXMgc2luZ2xlIFNN
QyBHRlhDTEsgc3RydWN0dXJlIHVzaW5nIHRoZSBwcm92aWRlZCBjbG9jay4KPiAgICoKPiAgICog
QGh3bWdyOiAgICAgdGhlIGFkZHJlc3Mgb2YgdGhlIGhhcmR3YXJlIG1hbmFnZXIuCj4gQEAgLTI4
NjMsOCArMjg2NSw4IEBAIHN0YXRpYyBpbnQgdmVnYTEwX3N0b3BfZHBtKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsIHVpbnQzMl90IGJpdG1hcCkKPiAgLyoqCj4gICAqIFRlbGwgU01DIHRvIGVuYWJs
ZWQgdGhlIHN1cHBvcnRlZCBEUE1zLgo+ICAgKgo+IC0gKiBAaHdtZ3I6ICB0aGUgYWRkcmVzcyBv
ZiB0aGUgcG93ZXJwbGF5IGhhcmR3YXJlIG1hbmFnZXIuCj4gLSAqIEBiaXRtYXAgIGJpdG1hcCBm
b3IgdGhlIGZlYXR1cmVzIHRvIGVuYWJsZWQuCj4gKyAqIEBod21ncjogICB0aGUgYWRkcmVzcyBv
ZiB0aGUgcG93ZXJwbGF5IGhhcmR3YXJlIG1hbmFnZXIuCj4gKyAqIEBiaXRtYXA6ICBiaXRtYXAg
Zm9yIHRoZSBmZWF0dXJlcyB0byBlbmFibGVkLgo+ICAgKiByZXR1cm46ICAwIG9uIGF0IGxlYXN0
IG9uZSBEUE0gaXMgc3VjY2Vzc2Z1bGx5IGVuYWJsZWQuCj4gICAqLwo+ICBzdGF0aWMgaW50IHZl
Z2ExMF9zdGFydF9kcG0oc3RydWN0IHBwX2h3bWdyICpod21nciwgdWludDMyX3QgYml0bWFwKQo+
IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
