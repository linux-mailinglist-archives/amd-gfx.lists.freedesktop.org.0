Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BA32950
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7461289A7A;
	Mon,  3 Jun 2019 07:24:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFA589A77
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 07:24:38 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f20so25459361edt.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Jun 2019 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=DsWoVBRKn8Nf6j7YIcL8+lPJsoFF6RKi+rGmSJ4RDe8=;
 b=DY+Sj3GFiQGyfX8KEy1GmRnK2drUCjBK+L/08O/cs4APnuo9G7U0hWfJEEN9gzQlgs
 SKIS+ogWIEv825MPDgx4mnUOkEdK+dq7hy1y9/hbzK/TDkkKZxh9bISLGhsf71HBqq+5
 Ml4y0zq6YJ6bL3KTNSX7ewRMPi1lbVylMb5eykR43GX56ziNbK1+VhYJYzduEvYjrzGO
 mtaWi95MKfA9meoUU1C+75+SDF705H5l+RXzOaPGvrFt+0PV2ELC77kzl7dH3mUIPOTw
 xVfff3e/c+5OZ3wfZl/y5e3oJbHb13jriZAREAzP5Z218LyMHs0U3CnITIAZA+Nl7Qdu
 ykFQ==
X-Gm-Message-State: APjAAAWG7UHKiEr3g/6Q+9l+wMJm1AVvm6+RxDULpR75m+qsaj1u7keV
 gRDrTL/yhti26K286G1dd+SyGg==
X-Google-Smtp-Source: APXvYqzNHR63Oa+q9vYagN/JatAEY3M7O7V7uC1akN2HI7dUrZSdY+agZw0JdffAdr5vfts3C+MP9A==
X-Received: by 2002:a17:906:30c3:: with SMTP id
 b3mr22021372ejb.153.1559546676893; 
 Mon, 03 Jun 2019 00:24:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e46sm3821495edd.80.2019.06.03.00.24.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 00:24:36 -0700 (PDT)
Date: Mon, 3 Jun 2019 09:24:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
Message-ID: <20190603072434.GZ21222@phenom.ffwll.local>
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
 <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
 <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
 <20190529193615.GX21222@phenom.ffwll.local>
 <bc79d169-0768-9671-660f-ffe4ceee4b47@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc79d169-0768-9671-660f-ffe4ceee4b47@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=DsWoVBRKn8Nf6j7YIcL8+lPJsoFF6RKi+rGmSJ4RDe8=;
 b=A825FRdoNaz7EjtllZoC6WEohvZa558h04DrKNnuhC+M+u0tKz1VD3dHA4E4d5x8vr
 FZ6eXFs5qqbsrRfNx5p+/gP/YA0hjFvZIYAWOW55GIoEMnZ763kNtYivRHB0wKjVkZzi
 SeH4uQlaD9AQvhWxSPULzC3T7DQIeUmdAdn7M=
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
Cc: Alex Deucher <alexdeucher@gmail.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDU6MDQ6MjBQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAyOS4wNS4xOSB1bSAyMTozNiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4g
PiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAwNDo0Mzo0NVBNICswMDAwLCBHcm9kem92c2t5LCBB
bmRyZXkgd3JvdGU6Cj4gPiA+IEkgZG9uJ3QsIHNvcnJ5Lgo+ID4gU2hvdWxkIHdlIGZpeCB0aGF0
PyBTZWVtcyBsaWtlIHlvdSBkbyBwbGVudHkgb2Ygc2NoZWR1bGVyIHN0dWZmLCBzbyB3b3VsZAo+
ID4gbWFrZSBzZW5zZSBJIGd1ZXNzIC4uLgo+IAo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUgcGF0Y2guCj4gCj4gQW5kICsx
IGZvciBnaXZpbmcgQW5kcmV5IGNvbW1pdCByaWdodHMgdG8gZHJtLW1pc2MtbmV4dC4KCklmIEFu
ZHJleSBpcyBvbiBib2FyZCB0b28sIHBscyBmaWxlIGFuIGlzc3VlIHdpdGggdGhlIGxlZ2FjeSBz
c2ggYWNjb3VudApyZXF1ZXN0cyB0ZW1wbGF0ZSBoZXJlOgpodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZnJlZWRlc2t0b3AvZnJlZWRlc2t0b3AvIAoKQW5kIHRoZW4gcGluZyBvbiBpcmMg
b3IgaGVyZSBzbyBkcm0tbWlzYyBmb2xrcyBjYW4gYWNrJmZvcndhcmQuCi1EYW5pZWwKCj4gCj4g
Q2hyaXN0aWFuLgo+IAo+ID4gLURhbmllbAo+ID4gCj4gPiA+IEFuZHJleQo+ID4gPiAKPiA+ID4g
T24gNS8yOS8xOSAxMjo0MiBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwg
TWF5IDI5LCAyMDE5IGF0IDEwOjI5IEFNIEFuZHJleSBHcm9kem92c2t5Cj4gPiA+ID4gPGFuZHJl
eS5ncm9kem92c2t5QGFtZC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4gPiA+ID4gUmV2aWV3
ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+ID4gPiAK
PiA+ID4gPiBJJ2xsIHB1c2ggaXQgdG8gZHJtLW1pc2MgaW4gYSBtaW51dGUgdW5sZXNzIHlvdSBo
YXZlIGNvbW1pdCByaWdodHMuCj4gPiA+ID4gCj4gPiA+ID4gQWxleAo+ID4gPiA+IAo+ID4gPiA+
ID4gLS0tCj4gPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
YyB8IDIgKysKPiA+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiA+
ID4gPiA+IGluZGV4IDQ5ZTdkMDcuLmMxMDU4ZWUgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiA+ID4gPiA+IEBAIC0zNTMsNiArMzUz
LDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5jcmVhc2Vfa2FybWEpOwo+ID4gPiA+ID4g
ICAgICogZHJtX3NjaGVkX3N0b3AgLSBzdG9wIHRoZSBzY2hlZHVsZXIKPiA+ID4gPiA+ICAgICAq
Cj4gPiA+ID4gPiAgICAgKiBAc2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5jZQo+ID4gPiA+ID4gKyAq
IEBiYWQ6IGpvYiB3aGljaCBjYXVzZWQgdGhlIHRpbWUgb3V0Cj4gPiA+ID4gPiAgICAgKgo+ID4g
PiA+ID4gICAgICogU3RvcCB0aGUgc2NoZWR1bGVyIGFuZCBhbHNvIHJlbW92ZXMgYW5kIGZyZWVz
IGFsbCBjb21wbGV0ZWQgam9icy4KPiA+ID4gPiA+ICAgICAqIE5vdGU6IGJhZCBqb2Igd2lsbCBu
b3QgYmUgZnJlZWQgYXMgaXQgbWlnaHQgYmUgdXNlZCBsYXRlciBhbmQgc28gaXQncwo+ID4gPiA+
ID4gQEAgLTQyMiw2ICs0MjMsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9zdG9wKTsKPiA+
ID4gPiA+ICAgICAqIGRybV9zY2hlZF9qb2JfcmVjb3ZlcnkgLSByZWNvdmVyIGpvYnMgYWZ0ZXIg
YSByZXNldAo+ID4gPiA+ID4gICAgICoKPiA+ID4gPiA+ICAgICAqIEBzY2hlZDogc2NoZWR1bGVy
IGluc3RhbmNlCj4gPiA+ID4gPiArICogQGZ1bGxfcmVjb3Zlcnk6IHByb2NlZWQgd2l0aCBjb21w
bGV0ZSBzY2hlZCByZXN0YXJ0Cj4gPiA+ID4gPiAgICAgKgo+ID4gPiA+ID4gICAgICovCj4gPiA+
ID4gPiAgICB2b2lkIGRybV9zY2hlZF9zdGFydChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNj
aGVkLCBib29sIGZ1bGxfcmVjb3ZlcnkpCj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi43LjQKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+ID4gPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
