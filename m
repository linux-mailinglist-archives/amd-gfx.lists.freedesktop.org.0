Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D62B5286
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 21:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2918F6EA78;
	Mon, 16 Nov 2020 20:29:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EFE6EA78;
 Mon, 16 Nov 2020 20:29:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12so13027101wrt.0;
 Mon, 16 Nov 2020 12:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WjF0+3gggL3CRxV+lz0GaLX559AxZaaqnyIMuQIwREE=;
 b=bYXFWC3hH+d2d7yRzU5tLQyCVVPymSrP9ZSuF0XEwrJ/DNRRg51hGeqoM41J1wPFhw
 FFrg9c6G6dEtFl0ivkDFOrF5M8R5OD1HQj9IllXKYNjM4x4razcDIswDwX5P2Fb7rLGp
 jJNor2Bt3Umj6Y6XHwvoLlCiKWpZ8441n5Iy/T/Sp/WTRcFnEpD8XIfajsh9+tp7aGnd
 sjDvSnxSiJznfIeDCbobfRsdmDcPfvT1QemTlzn+VuftEYpRFgLL84sLu4pQedfNbYUr
 LXipuL91qOyednqyW04B4LfbP4HlAH0tkT1E45P83fn3IP3hRfD9bmI987b4PI95w+Dg
 ca0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WjF0+3gggL3CRxV+lz0GaLX559AxZaaqnyIMuQIwREE=;
 b=aE/wK8jxIXgKfYZtVX3IF8A/pE+ZLh7H+sS0kIvxU0NBa8j38kiOb3fbCzzWcrwj7n
 gEA59Y+PW6uL757XVU61BejVeN8dBp/9x7LINrVvWeNiFd8EwZzFCeRlPT13Vpjj0vw0
 3Unl8I5FW4EEqcasoziEDqlTuh7lYaOqZJp1DrqZcedzvFiA1mthOBhei+1N/8I74/wd
 m1mLCDMP7tzm+8bThm7CiafKfMmeuxSlwYObTXpAVKR9OfeWew+LXxzKJZgj7yzTEUtU
 +SoPLfEBGS2TZYoe1fzOgv5YduMG++r9YQrq7NwilrK79H3updQUYQujBPVaWszvUXOV
 UvKA==
X-Gm-Message-State: AOAM533ezD59PVTEK1U55+88jSdtw5OpH5BY87NORQxcEBt+jhrbjcFV
 ePWYJFK4nBOYVFeTlH3lVd5Li2p7ep6cw85G0kw=
X-Google-Smtp-Source: ABdhPJy8gBCWoU/Com+s5wvBzSh2jbLDI7rBdHZHku93qeTcALOACefXO+a/MvKxLU+4yDX+j9DQ6RqdI+7VTsoCJ/M=
X-Received: by 2002:adf:e551:: with SMTP id z17mr21629520wrm.374.1605558586689; 
 Mon, 16 Nov 2020 12:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-34-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-34-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:29:35 -0500
Message-ID: <CADnq5_MkvKNMxPJ8Z=mawLY-Bq5KLb_n+QviWwhdvK+qZbXUoQ@mail.gmail.com>
Subject: Re: [PATCH 33/43] drm/radeon/radeon_audio: Move 'dce6_*()'s
 prototypes to shared header
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTZfYWZtdC5jOjMyOjU6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNl9lbmRwb2ludF9ycmVn
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMzIgfCB1MzIgZGNlNl9lbmRwb2ludF9ycmVn
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fgo+ICBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTZfYWZtdC5jOjQ2OjY6IHdhcm5pbmc6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlNl9lbmRwb2ludF93cmVn4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAgNDYgfCB2b2lkIGRjZTZfZW5kcG9pbnRfd3JlZyhzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwKPiAgfCBefn5+fn5+fn5+fn5+fn5+fn4KPiAgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9kY2U2X2FmbXQuYzoxMTA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhkY2U2X2FmbXRfc2VsZWN0X3BpbuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDEx
MCB8IHZvaWQgZGNlNl9hZm10X3NlbGVjdF9waW4oc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
KQo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZGNl
Nl9hZm10LmM6MTIzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNl
Nl9hZm10X3dyaXRlX2xhdGVuY3lfZmllbGRz4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAg
MTIzIHwgdm9pZCBkY2U2X2FmbXRfd3JpdGVfbGF0ZW5jeV9maWVsZHMoc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyLAo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTZfYWZtdC5jOjE1Mjo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmGRjZTZfYWZtdF9oZG1pX3dyaXRlX3NwZWFrZXJfYWxsb2NhdGlv
buKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDE1MiB8IHZvaWQgZGNlNl9hZm10X2hkbWlf
d3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9uKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAg
fCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9kY2U2X2FmbXQuYzoxNzc6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhkY2U2X2FmbXRfZHBfd3JpdGVfc3BlYWtlcl9hbGxvY2F0aW9u4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KPiAgMTc3IHwgdm9pZCBkY2U2X2FmbXRfZHBfd3JpdGVfc3BlYWtl
cl9hbGxvY2F0aW9uKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAgfCBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZGNl
Nl9hZm10LmM6MjAyOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNl
Nl9hZm10X3dyaXRlX3NhZF9yZWdz4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMjAyIHwg
dm9pZCBkY2U2X2FmbXRfd3JpdGVfc2FkX3JlZ3Moc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
LAo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2RjZTZfYWZtdC5jOjI2ODo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGRjZTZfaGRtaV9hdWRpb19zZXRfZHRv4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMjY4
IHwgdm9pZCBkY2U2X2hkbWlfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
diwKPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2RjZTZfYWZtdC5jOjI4Nzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGRjZTZfZHBfYXVkaW9fc2V0X2R0b+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDI4NyB8
IHZvaWQgZGNlNl9kcF9hdWRpb19zZXRfZHRvKHN0cnVjdCByYWRlb19kZXZpY2UgKnJkZXYsCj4g
IHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFNsYXZhIEdyaWdvcmV2IDxzbGF2
YS5ncmlnb3JldkBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9kY2U2X2FmbXQuYyAgICB8ICAxICsKPiAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9kY2U2X2FmbXQuaCAgICB8IDUyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jIHwg
MTcgKy0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Rj
ZTZfYWZtdC5oCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9kY2U2X2Fm
bXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZGNlNl9hZm10LmMKPiBpbmRleCBlZWM1ZDdh
NjI3Mzg4Li40YTFkNTQ0N2VhYzE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vZGNlNl9hZm10LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTZfYWZtdC5j
Cj4gQEAgLTIyLDYgKzIyLDcgQEAKPiAgICovCj4gICNpbmNsdWRlIDxsaW51eC9oZG1pLmg+Cj4K
PiArI2luY2x1ZGUgImRjZTZfYWZtdC5oIgo+ICAjaW5jbHVkZSAicmFkZW9uLmgiCj4gICNpbmNs
dWRlICJyYWRlb25fYXVkaW8uaCIKPiAgI2luY2x1ZGUgInNpZC5oIgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL2RjZTZfYWZtdC5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9kY2U2X2FmbXQuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
MC4uMTc2YTUzODY2NGEyNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL2RjZTZfYWZtdC5oCj4gQEAgLTAsMCArMSw1MiBAQAo+ICsvKiBkY2U2X2FmbXQuaCAt
LSBQcml2YXRlIGhlYWRlciBmb3IgcmFkZW9uIGRyaXZlciAtKi0gbGludXgtYyAtKi0KPiArICoK
PiArICogQ29weXJpZ2h0IDIwMTMgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgo+ICsgKgo+
ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55
IHBlcnNvbiBvYnRhaW5pbmcgYQo+ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29j
aWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAo+ICsgKiB0byBkZWFs
IGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBs
aW1pdGF0aW9uCj4gKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBw
dWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAo+ICsgKiBhbmQvb3Igc2VsbCBjb3BpZXMg
b2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKPiArICog
U29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcg
Y29uZGl0aW9uczoKPiArICoKPiArICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRo
aXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KPiArICogYWxsIGNvcGll
cyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCj4gKyAqCj4gKyAqIFRI
RSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBL
SU5ELCBFWFBSRVNTIE9SCj4gKyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQg
VE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAo+ICsgKiBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hB
TEwKPiArICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBG
T1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCj4gKyAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJ
TiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAo+ICsgKiBBUklTSU5H
IEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBV
U0UgT1IKPiArICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+ICsgKgo+ICsgKi8K
PiArCj4gKyNpZm5kZWYgX19EQ0U2X0FGTVRfSF9fCj4gKyNkZWZpbmUgX19EQ0U2X0FGTVRfSF9f
Cj4gKwo+ICtzdHJ1Y3QgY2VhX3NhZDsKPiArc3RydWN0IGRybV9jb25uZWN0b3I7Cj4gK3N0cnVj
dCBkcm1fZGlzcGxheV9tb2RlOwo+ICtzdHJ1Y3QgZHJtX2VuY29kZXI7Cj4gK3N0cnVjdCByYWRl
b25fY3J0YzsKPiArc3RydWN0IHJhZGVvbl9kZXZpY2U7Cj4gKwo+ICt1MzIgZGNlNl9lbmRwb2lu
dF9ycmVnKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIgb2Zmc2V0LCB1MzIgcmVnKTsK
PiArdm9pZCBkY2U2X2VuZHBvaW50X3dyZWcoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUz
MiBvZmZzZXQsIHUzMiByZWcsIHUzMiB2KTsKPiArdm9pZCBkY2U2X2FmbXRfd3JpdGVfc2FkX3Jl
Z3Moc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBjZWFfc2FkICpzYWRzLCBpbnQgc2FkX2NvdW50KTsKPiArdm9pZCBkY2U2
X2FmbXRfaGRtaV93cml0ZV9zcGVha2VyX2FsbG9jYXRpb24oc3RydWN0IGRybV9lbmNvZGVyICpl
bmNvZGVyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU4
ICpzYWRiLCBpbnQgc2FkX2NvdW50KTsKPiArdm9pZCBkY2U2X2FmbXRfZHBfd3JpdGVfc3BlYWtl
cl9hbGxvY2F0aW9uKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggKnNhZGIsIGludCBzYWRfY291bnQpOwo+
ICt2b2lkIGRjZTZfYWZtdF93cml0ZV9sYXRlbmN5X2ZpZWxkcyhzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4gK3ZvaWQgZGNlNl9hZm10X3Nl
bGVjdF9waW4oc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKPiArdm9pZCBkY2U2X2hkbWlf
YXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCByYWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNs
b2NrKTsKPiArdm9pZCBkY2U2X2RwX2F1ZGlvX3NldF9kdG8oc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJhZGVvbl9jcnRjICpj
cnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+ICsKPiArI2VuZGlmICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIF9fRENFNl9BRk1UX0hfXyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
YXVkaW8uYwo+IGluZGV4IDNjYzUzZGIwNGQ2NDUuLjc4NWMyM2NiMzA1ODkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMKPiBAQCAtMjUsNiArMjUsNyBAQAo+ICAjaW5j
bHVkZSA8bGludXgvZ2NkLmg+Cj4KPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ICsjaW5j
bHVkZSAiZGNlNl9hZm10LmgiCj4gICNpbmNsdWRlICJldmVyZ3JlZW5faGRtaS5oIgo+ICAjaW5j
bHVkZSAicmFkZW9uLmgiCj4gICNpbmNsdWRlICJhdG9tLmgiCj4gQEAgLTM0LDI2ICszNSwxMCBA
QCB2b2lkIHI2MDBfYXVkaW9fZW5hYmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1
Y3QgcjYwMF9hdWRpb19waW4gKnBpbiwKPiAgICAgICAgICAgICAgICAgdTggZW5hYmxlX21hc2sp
Owo+ICB2b2lkIGRjZTZfYXVkaW9fZW5hYmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBz
dHJ1Y3QgcjYwMF9hdWRpb19waW4gKnBpbiwKPiAgICAgICAgICAgICAgICAgdTggZW5hYmxlX21h
c2spOwo+IC11MzIgZGNlNl9lbmRwb2ludF9ycmVnKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
LCB1MzIgb2Zmc2V0LCB1MzIgcmVnKTsKPiAtdm9pZCBkY2U2X2VuZHBvaW50X3dyZWcoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4gLSAgICAgICAgICAgICAgIHUzMiBvZmZzZXQsIHUzMiBy
ZWcsIHUzMiB2KTsKPiAtdm9pZCBkY2U2X2FmbXRfd3JpdGVfc2FkX3JlZ3Moc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLAo+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgY2VhX3NhZCAqc2Fkcywg
aW50IHNhZF9jb3VudCk7Cj4gLXZvaWQgZGNlNl9hZm10X2hkbWlfd3JpdGVfc3BlYWtlcl9hbGxv
Y2F0aW9uKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAtICAgICAgICAgICAgICAgdTgg
KnNhZGIsIGludCBzYWRfY291bnQpOwo+IC12b2lkIGRjZTZfYWZtdF9kcF93cml0ZV9zcGVha2Vy
X2FsbG9jYXRpb24oc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+IC0gICAgICAgICAgICAg
ICB1OCAqc2FkYiwgaW50IHNhZF9jb3VudCk7Cj4gLXZvaWQgZGNlNl9hZm10X3dyaXRlX2xhdGVu
Y3lfZmllbGRzKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAtICAgICAgICAgICAgICAg
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km1vZGUpOwo+ICBzdHJ1Y3QgcjYwMF9hdWRpb19waW4qIHI2MDBfYXVkaW9fZ2V0X3BpbihzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gIHN0cnVjdCByNjAwX2F1ZGlvX3BpbiogZGNlNl9h
dWRpb19nZXRfcGluKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAtdm9pZCBkY2U2X2Fm
bXRfc2VsZWN0X3BpbihzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpOwo+ICB2b2lkIHI2MDBf
aGRtaV9hdWRpb19zZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICAgICAgICAg
c3RydWN0IHJhZGVvbl9jcnRjICpjcnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+IC12b2lkIGRj
ZTZfaGRtaV9hdWRpb19zZXRfZHRvKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+IC0gICAg
ICAgc3RydWN0IHJhZGVvbl9jcnRjICpjcnRjLCB1bnNpZ25lZCBpbnQgY2xvY2spOwo+IC12b2lk
IGRjZTZfZHBfYXVkaW9fc2V0X2R0byhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKPiAtICAg
ICAgIHN0cnVjdCByYWRlb25fY3J0YyAqY3J0YywgdW5zaWduZWQgaW50IGNsb2NrKTsKPiAgdm9p
ZCByNjAwX3NldF9hdmlfcGFja2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCB1MzIgb2Zm
c2V0LAo+ICAgICAgICAgdW5zaWduZWQgY2hhciAqYnVmZmVyLCBzaXplX3Qgc2l6ZSk7Cj4gIHZv
aWQgcjYwMF9oZG1pX3VwZGF0ZV9hY3Ioc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBsb25n
IG9mZnNldCwKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo=
