Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800CB342435
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Mar 2021 19:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084656EA68;
	Fri, 19 Mar 2021 18:14:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AEF6EA68;
 Fri, 19 Mar 2021 18:14:11 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 o19-20020a9d22130000b02901bfa5b79e18so9388749ota.0; 
 Fri, 19 Mar 2021 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t7kii8i5MvpTK371d7gij4/ROdmy9ZS9dtdrdIgpERw=;
 b=tH30REVX7GFAAVKCT2DKJGA3jKve8kd/s5uEfAZozZFPLTDcg8nCiuJuMDhw8EylBz
 QTY8aFlMFr1cjP4EJE5murjfj8zTcEzijciI7ZZOfHavd4iF1idyHTjhYqkksJHjf5R5
 GnYxH2DWML8qBdOOsqgfLm0mfUNKxVwB5zVeyAOfX3FEOXCFxS7ewqF72Dn3IAix0eoT
 w3ZbfvphE8BbUbB+lW4GrE+Wr/vrsx3RVr170DEcrK1VH9/yVs6SqPf9Ti/D3LnmOD6p
 bDazwTrFeYkd0AHhkDx6BYOPq5QcLofhxVyMEPEYfwtTHJX5+De0oNUTWJ7LSTxFnss3
 TmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t7kii8i5MvpTK371d7gij4/ROdmy9ZS9dtdrdIgpERw=;
 b=GbXzXZXjp+cTdBzIaeeeV/dTq5iSCnTkgvKR09b/lv+iLHs/0bWPCAnZuNW3Bxa0Ra
 Anv81sjI/xatgpZHcW767RkFey/csZ+yB9s1GlQRzc1TakKLxZlTjAN7zJPQW9yXAOUW
 0pqnr+D87BIFS3yDBlXP+q+8kfItcJOiFS47nUJO7/xZwpp6lTsA7ZhpFPucm3eT39YK
 LmXcb+vSYKnJfFjrQWUqnpehHXZGFv7ap57vgVtRj23M4AtO3YIYpbRPutm8CQPner6Z
 O2T4ZtUgB6qseqRj5EL12QC8nfEFC/2FJLzW9+D145r47T3SioWwLGZup7zQizm1072/
 ZIcA==
X-Gm-Message-State: AOAM5320C+6SYwVNeKKnLBLyv4EBUtg2yPmC/qPhun9KE7r0w+XPiK+v
 7N22iKc6CelvCRoGj7yg7r2qJpnoRItxMR4KYPM=
X-Google-Smtp-Source: ABdhPJyq79eRJv6Lt71XlLYgAXxA5utNtq+TeEHiEydT5TE6pXG6B9q90X21Evzyqb3ckNgB6X/lYjxskHZCoMTmuxk=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr2110488ots.23.1616177650625;
 Fri, 19 Mar 2021 11:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-7-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-7-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Mar 2021 14:13:59 -0400
Message-ID: <CADnq5_O7wFLzp7THHN15Diyw52XUN7w+HMks227LWcUvmXShcw@mail.gmail.com>
Subject: Re: [PATCH 06/19] drm/amd/display/dc/calcs/dce_calcs: Move some large
 variables from the stack to the heap
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

KyBIYXJyeSwgTmljawoKT24gRnJpLCBNYXIgMTksIDIwMjEgYXQgNDoyNCBBTSBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0x
IGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmM6IEluIGZ1bmN0aW9uIOKAmGNhbGN1bGF0
ZV9iYW5kd2lkdGjigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
ZGMvY2FsY3MvZGNlX2NhbGNzLmM6MjAxNjoxOiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6ZSBvZiAx
MjE2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1XZnJhbWUtbGFyZ2VyLXRoYW49
XQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IENvbGluIElhbiBLaW5nIDxjb2xp
bi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyAgfCAzMiArKysrKysrKysrKysrKysrLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3Mu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwo+IGlu
ZGV4IGU2MzNmOGE1MWVkYjYuLjlkOGYyNTA1YTYxYzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jCj4gQEAgLTk4LDE2ICs5OCwx
NiBAQCBzdGF0aWMgdm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAo+ICAgICAgICAgaW50MzJfdCBu
dW1fY3Vyc29yX2xpbmVzOwo+Cj4gICAgICAgICBpbnQzMl90IGksIGosIGs7Cj4gLSAgICAgICBz
dHJ1Y3QgYndfZml4ZWQgeWNsa1szXTsKPiAtICAgICAgIHN0cnVjdCBid19maXhlZCBzY2xrWzhd
Owo+ICsgICAgICAgc3RydWN0IGJ3X2ZpeGVkICp5Y2xrOwo+ICsgICAgICAgc3RydWN0IGJ3X2Zp
eGVkICpzY2xrOwo+ICAgICAgICAgYm9vbCBkMF91bmRlcmxheV9lbmFibGU7Cj4gICAgICAgICBi
b29sIGQxX3VuZGVybGF5X2VuYWJsZTsKPiAgICAgICAgIGJvb2wgZmJjX2VuYWJsZWQ7Cj4gICAg
ICAgICBib29sIGxwdF9lbmFibGVkOwo+ICAgICAgICAgZW51bSBid19kZWZpbmVzIHNjbGtfbWVz
c2FnZTsKPiAgICAgICAgIGVudW0gYndfZGVmaW5lcyB5Y2xrX21lc3NhZ2U7Cj4gLSAgICAgICBl
bnVtIGJ3X2RlZmluZXMgdGlsaW5nX21vZGVbbWF4aW11bV9udW1iZXJfb2Zfc3VyZmFjZXNdOwo+
IC0gICAgICAgZW51bSBid19kZWZpbmVzIHN1cmZhY2VfdHlwZVttYXhpbXVtX251bWJlcl9vZl9z
dXJmYWNlc107Cj4gKyAgICAgICBlbnVtIGJ3X2RlZmluZXMgKnRpbGluZ19tb2RlOwo+ICsgICAg
ICAgZW51bSBid19kZWZpbmVzICpzdXJmYWNlX3R5cGU7Cj4gICAgICAgICBlbnVtIGJ3X2RlZmlu
ZXMgdm9sdGFnZTsKPiAgICAgICAgIGVudW0gYndfZGVmaW5lcyBwaXBlX2NoZWNrOwo+ICAgICAg
ICAgZW51bSBid19kZWZpbmVzIGhzcl9jaGVjazsKPiBAQCAtMTIyLDYgKzEyMiwyMiBAQCBzdGF0
aWMgdm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAo+ICAgICAgICAgaW50MzJfdCBudW1iZXJfb2Zf
ZGlzcGxheXNfZW5hYmxlZF93aXRoX21hcmdpbiA9IDA7Cj4gICAgICAgICBpbnQzMl90IG51bWJl
cl9vZl9hbGlnbmVkX2Rpc3BsYXlzX3dpdGhfbm9fbWFyZ2luID0gMDsKPgo+ICsgICAgICAgeWNs
ayA9IGtjYWxsb2MoMywgc2l6ZW9mKCp5Y2xrKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZiAo
IXljbGspCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICBzY2xrID0ga2Nh
bGxvYyg4LCBzaXplb2YoKnNjbGspLCBHRlBfS0VSTkVMKTsKPiArICAgICAgIGlmICghc2NsaykK
PiArICAgICAgICAgICAgICAgZ290byBmcmVlX3ljbGs7Cj4gKwo+ICsgICAgICAgdGlsaW5nX21v
ZGUgPSBrY2FsbG9jKG1heGltdW1fbnVtYmVyX29mX3N1cmZhY2VzLCBzaXplb2YoKnRpbGluZ19t
b2RlKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZiAoIXRpbGluZ19tb2RlKQo+ICsgICAgICAg
ICAgICAgICBnb3RvIGZyZWVfc2NsazsKPiArCj4gKyAgICAgICBzdXJmYWNlX3R5cGUgPSBrY2Fs
bG9jKG1heGltdW1fbnVtYmVyX29mX3N1cmZhY2VzLCBzaXplb2YoKnN1cmZhY2VfdHlwZSksIEdG
UF9LRVJORUwpOwo+ICsgICAgICAgaWYgKCFzdXJmYWNlX3R5cGUpCj4gKyAgICAgICAgICAgICAg
IGdvdG8gZnJlZV90aWxpbmdfbW9kZTsKPiArCgoKSGFycnkgb3IgTmljayBjYW4gY29ycmVjdCBt
ZSBpZiBJJ20gd3JvbmcsIGJ1dCBmb3IgdGhpcyBwYXRjaCBhbmQgdGhlCm5leHQgb25lLCBJIHRo
aW5rIHRoaXMgY2FuIGJlIGNhbGxlZCBmcm9tIGFuIGF0b21pYyBjb250ZXh0LgoKQWxleAoKPiAg
ICAgICAgIHljbGtbbG93XSA9IHZiaW9zLT5sb3dfeWNsazsKPiAgICAgICAgIHljbGtbbWlkXSA9
IHZiaW9zLT5taWRfeWNsazsKPiAgICAgICAgIHljbGtbaGlnaF0gPSB2Ymlvcy0+aGlnaF95Y2xr
Owo+IEBAIC0yMDEzLDYgKzIwMjksMTQgQEAgc3RhdGljIHZvaWQgY2FsY3VsYXRlX2JhbmR3aWR0
aCgKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAg
ICAgIH0KPiArCj4gKyAgICAgICBrZnJlZShzdXJmYWNlX3R5cGUpOwo+ICtmcmVlX3RpbGluZ19t
b2RlOgo+ICsgICAgICAga2ZyZWUodGlsaW5nX21vZGUpOwo+ICtmcmVlX3ljbGs6Cj4gKyAgICAg
ICBrZnJlZSh5Y2xrKTsKPiArZnJlZV9zY2xrOgo+ICsgICAgICAga2ZyZWUoc2Nsayk7Cj4gIH0K
Pgo+ICAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IC0tCj4gMi4yNy4wCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
