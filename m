Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AE52AE3A2
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Nov 2020 23:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D89289D00;
	Tue, 10 Nov 2020 22:49:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4567689D00;
 Tue, 10 Nov 2020 22:49:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so92451wrw.10;
 Tue, 10 Nov 2020 14:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QxHHXS3cE89335PSH++B3mpGjtCNjtBO+QlCYD3Zvgg=;
 b=d7Cf/FwtcLiCtQMr2eyAmlsaUArJWJ0mziqwcGthPg+06xrhupxq3z2PJhG4/MOQ1v
 2y24q3ZKffwNLday4vMhmBJKmvLVB5yTGkioUypllMxDxoy4nC+axoHxhTsS09qxLvEF
 aNfrZS3g+ONTPB2yFxfxA9xgifBMPyoEtCijAHg3dXeWSPWNJI2XBjjspAPTmiug38mC
 adG3s8vzndR9dtkuigjX6S0VrdKvOTg/PoYVIiGceMfBTLzh0qh93YHsNz/aDmDBy78g
 IYmjb2gdKK53T4MtNvzkA7E8EWbdwcFn1ZK6kleNWR6sl8ftlxUeW1BsD4/LZBXDcn1y
 apSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QxHHXS3cE89335PSH++B3mpGjtCNjtBO+QlCYD3Zvgg=;
 b=WAt1/+iCx8sRASoQakmwgVvwKqkOiegTRdG9cDQUG1wmqezW6+kUZJr6sIIEyGNrzj
 zDfugMUTVvQnXMxuRLikDP/TFosIO86KTfvWqEQdZDjUd4CHTTGlCDv9y+HtovRYYbTT
 x+JsJM6AKdyyQpR8qBzqKzUu2pCF91D0YzH9k8xuHk4MQYiYaC1kJgeGu8wWfl0RHlzg
 eB5WyCEHDpWP+PmkPQUTY43LLVIxK0aMyRlXlF+3J+rRHIdMmokUhVv3IFptkGT4zKa+
 jmNVMJ4fHTZT2fYPWPGL/X82KiuZT7p22Vs3e+myXF1c39GWT0xMjxWgz/9Pefk/GQjC
 yxIg==
X-Gm-Message-State: AOAM531vd2fBgeTvlFcwIol2E/C9FYCMUe6sq1L7Kx0wqOa6J7VyE+SY
 XkttUcTf/1p3vwo70BFElH3YwdC7DTvzrilxHEQ=
X-Google-Smtp-Source: ABdhPJymLAqxpu3e02/OvsvW/fAZlu4drY7sx7O8tcwcyxZTALYLa8ia33M2ks/S4NtXxb3AAC3z65dgBL+gdcUEYd8=
X-Received: by 2002:adf:e551:: with SMTP id z17mr27115192wrm.374.1605048543898; 
 Tue, 10 Nov 2020 14:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-21-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-21-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:48:52 -0500
Message-ID: <CADnq5_NEGAkOQTthXYpG_BaaLS2vcD3RC7FTSSZ=cDw26-TPtA@mail.gmail.com>
Subject: Re: [PATCH 20/20] drm/radeon/cik: Fix a bunch of function parameter
 descriptions
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzoxODY5OjU6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYY2lfbWNfbG9hZF9taWNyb2NvZGXigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jOiBJ
biBmdW5jdGlvbiDigJhjaWtfZ3B1X2luaXTigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
Y2lrLmM6MzE4MTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhtY19zaGFyZWRfY2htYXDigJkgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9jaWsuYzogQXQgdG9wIGxldmVsOgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5jOjQ4NTI6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtf
Z3B1X2NoZWNrX3NvZnRfcmVzZXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2Npay5jOjU4NTA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhjaWtfZW50ZXJfcmxjX3NhZmVfbW9kZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlw
ZXNdCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmM6NTg3MTo2OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGNpa19leGl0X3JsY19zYWZlX21vZGXigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jOjYyODk6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtfdXBkYXRlX2Nn4oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo2NDIx
OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYY2lrX2luaXRfY3BfcGdf
dGFibGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5jOjY2Nzg6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhjaWtf
Z2V0X2NzYl9zaXpl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9jaWsuYzo2NzEwOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYY2lrX2dldF9jc2JfYnVmZmVy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYzozMDg0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdtYXhfcmJfbnVtX3Blcl9zZScgbm90IGRlc2NyaWJlZCBpbiAnY2lrX2dldF9y
Yl9kaXNhYmxlZCcKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzozMDg0OiB3YXJuaW5n
OiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdtYXhfcmJfbnVtJyBkZXNjcmlwdGlvbiBpbiAn
Y2lrX2dldF9yYl9kaXNhYmxlZCcKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzozMDg0
OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdzZV9udW0nIGRlc2NyaXB0aW9u
IGluICdjaWtfZ2V0X3JiX2Rpc2FibGVkJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5j
OjMxMTQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ21heF9yYl9udW1f
cGVyX3NlJyBub3QgZGVzY3JpYmVkIGluICdjaWtfc2V0dXBfcmInCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vY2lrLmM6MzExNDogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAn
bWF4X3JiX251bScgZGVzY3JpcHRpb24gaW4gJ2Npa19zZXR1cF9yYicKPiAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9jaWsuYzo1NjYyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdtY19jbGllbnQnIG5vdCBkZXNjcmliZWQgaW4gJ2Npa192bV9kZWNvZGVfZmF1bHQnCj4g
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmM6NTY5MDogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAncmluZycgbm90IGRlc2NyaWJlZCBpbiAnY2lrX3ZtX2ZsdXNoJwo+
ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jOjU2OTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ3ZtX2lkJyBub3QgZGVzY3JpYmVkIGluICdjaWtfdm1fZmx1c2gn
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmM6NTY5MDogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAncGRfYWRkcicgbm90IGRlc2NyaWJlZCBpbiAnY2lrX3ZtX2Zs
dXNoJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBs
aW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZCB3aXRoIG1pbm9yIGZpeHVwcy4gIFRoYW5r
cyEKCkFsZXgKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jIHwgMTAgKysr
Ky0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2Npay5jCj4gaW5kZXggNWM0Mjg3N2ZkNmZiZi4uNDQ5NGY5MTIyZmQ5
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYwo+IEBAIC0zMDcxLDggKzMwNzEsNyBAQCBzdGF0aWMg
dTMyIGNpa19jcmVhdGVfYml0bWFzayh1MzIgYml0X3dpZHRoKQo+ICAgKiBjaWtfZ2V0X3JiX2Rp
c2FibGVkIC0gY29tcHV0ZXMgdGhlIG1hc2sgb2YgZGlzYWJsZWQgUkJzCj4gICAqCj4gICAqIEBy
ZGV2OiByYWRlb25fZGV2aWNlIHBvaW50ZXIKPiAtICogQG1heF9yYl9udW06IG1heCBSQnMgKHJl
bmRlciBiYWNrZW5kcykgZm9yIHRoZSBhc2ljCj4gLSAqIEBzZV9udW06IG51bWJlciBvZiBTRXMg
KHNoYWRlciBlbmdpbmVzKSBmb3IgdGhlIGFzaWMKPiArICogQG1heF9yYl9udW1fcGVyX3NlOiBt
YXggUkJzIChyZW5kZXIgYmFja2VuZHMpIGZvciB0aGUgYXNpYwo+ICAgKiBAc2hfcGVyX3NlOiBu
dW1iZXIgb2YgU0ggYmxvY2tzIHBlciBTRSBmb3IgdGhlIGFzaWMKPiAgICoKPiAgICogQ2FsY3Vs
YXRlcyB0aGUgYml0bWFzayBvZiBkaXNhYmxlZCBSQnMgKENJSykuCj4gQEAgLTMxMDQsNyArMzEw
Myw3IEBAIHN0YXRpYyB1MzIgY2lrX2dldF9yYl9kaXNhYmxlZChzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZSAqcmRldiwKPiAgICogQHJkZXY6IHJhZGVvbl9kZXZpY2UgcG9pbnRlcgo+ICAgKiBAc2VfbnVt
OiBudW1iZXIgb2YgU0VzIChzaGFkZXIgZW5naW5lcykgZm9yIHRoZSBhc2ljCj4gICAqIEBzaF9w
ZXJfc2U6IG51bWJlciBvZiBTSCBibG9ja3MgcGVyIFNFIGZvciB0aGUgYXNpYwo+IC0gKiBAbWF4
X3JiX251bTogbWF4IFJCcyAocmVuZGVyIGJhY2tlbmRzKSBmb3IgdGhlIGFzaWMKPiArICogQG1h
eF9yYl9udW1fcGVyX3NlOiBtYXggUkJzIChyZW5kZXIgYmFja2VuZHMpIGZvciB0aGUgYXNpYwo+
ICAgKgo+ICAgKiBDb25maWd1cmVzIHBlci1TRS9TSCBSQiByZWdpc3RlcnMgKENJSykuCj4gICAq
Lwo+IEBAIC01NjU0LDYgKzU2NTMsNyBAQCB2b2lkIGNpa192bV9maW5pKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KQo+ICAgKiBAcmRldjogcmFkZW9uX2RldmljZSBwb2ludGVyCj4gICAqIEBz
dGF0dXM6IFZNX0NPTlRFWFQxX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTIHJlZ2lzdGVyIHZhbHVl
Cj4gICAqIEBhZGRyOiBWTV9DT05URVhUMV9QUk9URUNUSU9OX0ZBVUxUX0FERFIgcmVnaXN0ZXIg
dmFsdWUKPiArICogQG1jX2NsaWVudDogVk1fQ09OVEVYVDFfUFJPVEVDVElPTl9GQVVMVF9NQ0NM
SUVOVCByZWdpc3RlciB2YWx1ZQo+ICAgKgo+ICAgKiBQcmludCBodW1hbiByZWFkYWJsZSBmYXVs
dCBpbmZvcm1hdGlvbiAoQ0lLKS4KPiAgICovCj4gQEAgLTU2NzcsMTEgKzU2NzcsOSBAQCBzdGF0
aWMgdm9pZCBjaWtfdm1fZGVjb2RlX2ZhdWx0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+
ICAgICAgICAgICAgICAgIGJsb2NrLCBtY19jbGllbnQsIG1jX2lkKTsKPiAgfQo+Cj4gLS8qKgo+
ICsvKgo+ICAgKiBjaWtfdm1fZmx1c2ggLSBjaWsgdm0gZmx1c2ggdXNpbmcgdGhlIENQCj4gICAq
Cj4gLSAqIEByZGV2OiByYWRlb25fZGV2aWNlIHBvaW50ZXIKPiAtICoKPiAgICogVXBkYXRlIHRo
ZSBwYWdlIHRhYmxlIGJhc2UgYW5kIGZsdXNoIHRoZSBWTSBUTEIKPiAgICogdXNpbmcgdGhlIENQ
IChDSUspLgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAo=
