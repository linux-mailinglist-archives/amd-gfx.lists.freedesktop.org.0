Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E02B516E
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647006E0DE;
	Mon, 16 Nov 2020 19:45:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1036E0DE;
 Mon, 16 Nov 2020 19:45:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 19so449471wmf.1;
 Mon, 16 Nov 2020 11:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1uCpe1byY5J38WnMdFLiTIlTnh+9QMbRg1Ws0y40+88=;
 b=fFmPxyr/y2GMNIyxinzL20IIGegusR591p7d6qtxbMk0EH7Jw29vYC+KLC8ng2sfnX
 vVJ3h3iL7iP8ZMWVX7aKzUGWxROCy8LfrddbSjVTaIUkC74enP751Re1UtUH8QekRgqh
 cpFx7jq7Up2WAtUSLg3dPojHOF2WLUOsqUjlx2fa6qDsG90CJ8Ivf3WpKHC21xQQlLz6
 /8jFbhcL0nco/bK1BnWwuF4OsKyNRjxkwM6nd4aY+NH3bMuMS5Yhs2dS8ZKV4Cb0jftO
 KgeljIXxvsrbujAkLcB5T0vQM08MeqwrHYGL0dF9c7T3Gz/zCIhmnc816dp729Hh/ttB
 S82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1uCpe1byY5J38WnMdFLiTIlTnh+9QMbRg1Ws0y40+88=;
 b=fJCYf3X78EoNu9h4yHIWcNg3kb6jaEA6DsCUmbLL2n55x2KDvXNSW195Sr2bkR9YLf
 WfvRc8Hlguc2lXXlIRqP594DhU6Aogt0vllu8VDx9oXS08rEJPiPKLRBDud2Fb+5Hx+W
 mxCFlniBVyTb4HxXhBxKRdcbmmXLlOfvt1DlA7eKNMDfkQTU7kL73OtVXLJCMkxioW3u
 H27woZblPWp1s/jAKk5gEgnxcm6U6k7LDZAKQOXB9KkUlWV81QiGmYs7wXemAdq+9bZk
 8C+LOQqnO6BMW4Y4NTvIYnANSz94ZjhkQiBEEJLKT4X4j+JUHLlQ/BnGDA5XXnoM/WEZ
 oV4w==
X-Gm-Message-State: AOAM533aP6WJ+pCqhYeOA8AwNwYDF/lDaDnlIEpLOK81wH+xefvDQNcG
 +iutvYDWNqfgSNLc718ylpbVWZbU8De9MVnT3DM=
X-Google-Smtp-Source: ABdhPJyMoaWATdgQf/8+LhTLg5ziSaFytvDZu4lnbCExubtttYTGyLTAEp1s14NYJetfC308Nw94G32gV0BzkmI6qeg=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr544786wmb.56.1605555938984;
 Mon, 16 Nov 2020 11:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org>
 <20201116173005.1825880-12-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 14:45:28 -0500
Message-ID: <CADnq5_Oe3a6nHfMghgAzxXNHVPs5W4t6yfzEHP28Njo4npx2rA@mail.gmail.com>
Subject: Re: [PATCH 11/43] drm/radeon/radeon_audio: Move 'dce3_2_*' prototypes
 to shared location
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
Cc: David Airlie <airlied@linux.ie>, Slava Grigorev <slava.grigorev@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzAgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTNfMV9hZm10LmM6MzA6
Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2UzXzJfYWZtdF9oZG1p
X3dyaXRlX3NwZWFrZXJfYWxsb2NhdGlvbuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDMw
IHwgdm9pZCBkY2UzXzJfYWZtdF9oZG1pX3dyaXRlX3NwZWFrZXJfYWxsb2NhdGlvbihzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9kY2UzXzFfYWZtdC5jOjQ4OjY6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlM18yX2FmbXRfZHBfd3Jp
dGVfc3BlYWtlcl9hbGxvY2F0aW9u4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgNDggfCB2
b2lkIGRjZTNfMl9hZm10X2RwX3dyaXRlX3NwZWFrZXJfYWxsb2NhdGlvbihzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIsCj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZGNlM18xX2FmbXQuYzo2Njo2OiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTNfMl9hZm10X3dyaXRlX3NhZF9yZWdz
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgNjYgfCB2b2lkIGRjZTNfMl9hZm10X3dyaXRl
X3NhZF9yZWdzKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAgfCBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTNfMV9hZm10LmM6MTE2
OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlM18yX2F1ZGlvX3Nl
dF9kdG/igJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAxMTYgfCB2b2lkIGRjZTNfMl9hdWRp
b19zZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICB8IF5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZGNlM18xX2FmbXQuYzoxNzA6Njogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2UzXzJfaGRtaV91cGRhdGVfYWNy
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMTcwIHwgdm9pZCBkY2UzXzJfaGRtaV91cGRh
dGVfYWNyKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgbG9uZyBvZmZzZXQsCj4gIHwgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTNfMV9hZm10
LmM6MjAyOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlM18yX3Nl
dF9hdWRpb19wYWNrZXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAyMDIgfCB2b2lkIGRj
ZTNfMl9zZXRfYXVkaW9fcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9m
ZnNldCkKPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2RjZTNfMV9hZm10LmM6MjIzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBm
b3Ig4oCYZGNlM18yX3NldF9tdXRl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMjIzIHwg
dm9pZCBkY2UzXzJfc2V0X211dGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCB1MzIgb2Zm
c2V0LCBib29sIG11dGUpCj4gIHwgXn5+fn5+fn5+fn5+fn5+Cj4KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFNsYXZhIEdy
aWdvcmV2IDxzbGF2YS5ncmlnb3JldkBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFu
a3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5j
IHwgMTIgLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlv
LmggfCAxMiArKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYwo+
IGluZGV4IDhjNjNjY2I4YjYyMzUuLmY2Yzc4M2UxOWM5ODggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2F1ZGlvLmMKPiBAQCAtMzgsMTYgKzM4LDEwIEBAIHZvaWQgZGNlNl9hdWRp
b19lbmFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByNjAwX2F1ZGlvX3Bp
biAqcGluLAo+ICB1MzIgZGNlNl9lbmRwb2ludF9ycmVnKHN0cnVjdCByYWRlb25fZGV2aWNlICpy
ZGV2LCB1MzIgb2Zmc2V0LCB1MzIgcmVnKTsKPiAgdm9pZCBkY2U2X2VuZHBvaW50X3dyZWcoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gICAgICAgICAgICAgICAgIHUzMiBvZmZzZXQsIHUz
MiByZWcsIHUzMiB2KTsKPiAtdm9pZCBkY2UzXzJfYWZtdF93cml0ZV9zYWRfcmVncyhzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gLSAgICAgICAgICAgICAgIHN0cnVjdCBjZWFfc2FkICpz
YWRzLCBpbnQgc2FkX2NvdW50KTsKPiAgdm9pZCBldmVyZ3JlZW5faGRtaV93cml0ZV9zYWRfcmVn
cyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gICAgICAgICAgICAgICAgIHN0cnVjdCBj
ZWFfc2FkICpzYWRzLCBpbnQgc2FkX2NvdW50KTsKPiAgdm9pZCBkY2U2X2FmbXRfd3JpdGVfc2Fk
X3JlZ3Moc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICAgICAgICAgICAgICAgICBzdHJ1
Y3QgY2VhX3NhZCAqc2FkcywgaW50IHNhZF9jb3VudCk7Cj4gLXZvaWQgZGNlM18yX2FmbXRfaGRt
aV93cml0ZV9zcGVha2VyX2FsbG9jYXRpb24oc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+
IC0gICAgICAgICAgICAgICB1OCAqc2FkYiwgaW50IHNhZF9jb3VudCk7Cj4gLXZvaWQgZGNlM18y
X2FmbXRfZHBfd3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
b2RlciwKPiAtICAgICAgICAgICAgICAgdTggKnNhZGIsIGludCBzYWRfY291bnQpOwo+ICB2b2lk
IGRjZTRfYWZtdF9oZG1pX3dyaXRlX3NwZWFrZXJfYWxsb2NhdGlvbihzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIsCj4gICAgICAgICAgICAgICAgIHU4ICpzYWRiLCBpbnQgc2FkX2NvdW50KTsK
PiAgdm9pZCBkY2U0X2FmbXRfZHBfd3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlciwKPiBAQCAtNjUsOCArNTksNiBAQCBzdHJ1Y3QgcjYwMF9hdWRpb19w
aW4qIGRjZTZfYXVkaW9fZ2V0X3BpbihzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gIHZv
aWQgZGNlNl9hZm10X3NlbGVjdF9waW4oc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKPiAg
dm9pZCByNjAwX2hkbWlfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwK
PiAgICAgICAgIHN0cnVjdCByYWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNsb2NrKTsK
PiAtdm9pZCBkY2UzXzJfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwK
PiAtICAgICAgIHN0cnVjdCByYWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNsb2NrKTsK
PiAgdm9pZCBkY2U0X2hkbWlfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
diwKPiAgICAgICAgIHN0cnVjdCByYWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNsb2Nr
KTsKPiAgdm9pZCBkY2U0X2RwX2F1ZGlvX3NldF9kdG8oc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYsCj4gQEAgLTgxLDggKzczLDYgQEAgdm9pZCBldmVyZ3JlZW5fc2V0X2F2aV9wYWNrZXQoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBvZmZzZXQsCj4gICAgICAgICB1bnNpZ25lZCBj
aGFyICpidWZmZXIsIHNpemVfdCBzaXplKTsKPiAgdm9pZCByNjAwX2hkbWlfdXBkYXRlX2Fjcihz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIGxvbmcgb2Zmc2V0LAo+ICAgICAgICAgY29uc3Qg
c3RydWN0IHJhZGVvbl9oZG1pX2FjciAqYWNyKTsKPiAtdm9pZCBkY2UzXzJfaGRtaV91cGRhdGVf
YWNyKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgbG9uZyBvZmZzZXQsCj4gLSAgICAgICBj
b25zdCBzdHJ1Y3QgcmFkZW9uX2hkbWlfYWNyICphY3IpOwo+ICB2b2lkIGV2ZXJncmVlbl9oZG1p
X3VwZGF0ZV9hY3Ioc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBsb25nIG9mZnNldCwKPiAg
ICAgICAgIGNvbnN0IHN0cnVjdCByYWRlb25faGRtaV9hY3IgKmFjcik7Cj4gIHZvaWQgcjYwMF9z
ZXRfdmJpX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHUzMiBvZmZzZXQpOwo+
IEBAIC05MCwxMCArODAsOCBAQCB2b2lkIGRjZTRfc2V0X3ZiaV9wYWNrZXQoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0KTsKPiAgdm9pZCBkY2U0X2hkbWlfc2V0X2NvbG9y
X2RlcHRoKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAgICAgICAgIHUzMiBvZmZzZXQs
IGludCBicGMpOwo+ICB2b2lkIHI2MDBfc2V0X2F1ZGlvX3BhY2tldChzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIsIHUzMiBvZmZzZXQpOwo+IC12b2lkIGRjZTNfMl9zZXRfYXVkaW9fcGFja2V0
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCk7Cj4gIHZvaWQgZGNlNF9z
ZXRfYXVkaW9fcGFja2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCk7
Cj4gIHZvaWQgcjYwMF9zZXRfbXV0ZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsIHUzMiBv
ZmZzZXQsIGJvb2wgbXV0ZSk7Cj4gLXZvaWQgZGNlM18yX3NldF9tdXRlKHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCwgYm9vbCBtdXRlKTsKPiAgdm9pZCBkY2U0X3NldF9t
dXRlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgdTMyIG9mZnNldCwgYm9vbCBtdXRlKTsK
PiAgc3RhdGljIHZvaWQgcmFkZW9uX2F1ZGlvX2hkbWlfbW9kZV9zZXQoc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyLAo+ICAgICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5oIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uaAo+IGluZGV4IDVjNzBjY2VhYTRhNmMu
LjA1ZTY3ODY3NDY5YjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fYXVkaW8uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmgK
PiBAQCAtODEsNCArODEsMTYgQEAgdm9pZCByYWRlb25fYXVkaW9fbW9kZV9zZXQoc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLAo+ICB2b2lkIHJhZGVvbl9hdWRpb19kcG1zKHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlciwgaW50IG1vZGUpOwo+ICB1bnNpZ25lZCBpbnQgcmFkZW9uX2F1ZGlv
X2RlY29kZV9kZnNfZGl2KHVuc2lnbmVkIGludCBkaXYpOwo+Cj4gK3ZvaWQgZGNlM18yX2FmbXRf
d3JpdGVfc2FkX3JlZ3Moc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNlYV9zYWQgKnNhZHMsIGludCBzYWRfY291bnQp
Owo+ICt2b2lkIGRjZTNfMl9hZm10X2hkbWlfd3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHU4ICpzYWRiLCBpbnQgc2FkX2NvdW50KTsKPiArdm9pZCBkY2UzXzJf
YWZtdF9kcF93cml0ZV9zcGVha2VyX2FsbG9jYXRpb24oc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU4ICpz
YWRiLCBpbnQgc2FkX2NvdW50KTsKPiArdm9pZCBkY2UzXzJfYXVkaW9fc2V0X2R0byhzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBy
YWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNsb2NrKTsKPiArdm9pZCBkY2UzXzJfaGRt
aV91cGRhdGVfYWNyKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwgbG9uZyBvZmZzZXQsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCByYWRlb25faGRtaV9hY3Ig
KmFjcik7Cj4gK3ZvaWQgZGNlM18yX3NldF9hdWRpb19wYWNrZXQoc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyLCB1MzIgb2Zmc2V0KTsKPiArdm9pZCBkY2UzXzJfc2V0X211dGUoc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLCB1MzIgb2Zmc2V0LCBib29sIG11dGUpOwo+ICAjZW5kaWYKPiAt
LQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
