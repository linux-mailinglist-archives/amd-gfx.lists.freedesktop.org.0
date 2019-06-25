Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE32552FF
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 17:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A036E148;
	Tue, 25 Jun 2019 15:13:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBF86E145;
 Tue, 25 Jun 2019 15:13:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s15so3364338wmj.3;
 Tue, 25 Jun 2019 08:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nFaG3cFFJXUnBTKp3fZCuRdacp8h/mCY/1stOdIEYPo=;
 b=sm208tSB5cHiiLfiDTRoi5tpIueUZnSLTglp5ESB2vm37bIvxDOAICzKAp6v+bnk0N
 eNyztZKg1z9R03V5o7L2e/cKQ8fVcVU4pUeqxk57woum8eg70HrMJi5bf/9GKUSHBMKW
 WjjlpsyJMcc2agRXP9r0A1AK1WfkHYqqg/8WjE6furaIzIwwX1Vyh0TBdobre2k7YGMV
 wnUF2tnCjatH4daODaWLsA3UYdrRWKMpuwrwZy5wSR42197NsVu4ZoNuvbi3hBlhmALZ
 oW1HJS1zAE7RJzfhykCjgZ38YBIcji6j780+z5VAX2tHDOf3EHicIqXpC0j5p100jCvt
 BBiw==
X-Gm-Message-State: APjAAAUgIuJwduqVbMd/ugmWU6eI4giqNJyCpu7qgVC7VahzXOQR5ujR
 sKBX4v1wOuGZHZLYCCEylUbrcqyU
X-Google-Smtp-Source: APXvYqzAKzQR0n5B9S7mCPSV9lmtsmG+kvmzIChEjaIK7pt3J6nIVCherX/zaFThmx85W35hZUAGOg==
X-Received: by 2002:a1c:4d6:: with SMTP id 205mr18637993wme.148.1561475624901; 
 Tue, 25 Jun 2019 08:13:44 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y4sm3714988wrn.68.2019.06.25.08.13.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 08:13:44 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v12
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20190625124654.122364-1-christian.koenig@amd.com>
 <20190625143548.GX12905@phenom.ffwll.local>
 <256e6aef-b4c9-3b1e-6522-31fed42d2c62@gmail.com>
 <CAKMK7uGyh2J3es=1OBEv1Dn46mkPa2vgz+xxqqTQhkEAxzqs_g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6fdde041-89f8-ff12-d237-3e280f0af21c@gmail.com>
Date: Tue, 25 Jun 2019 17:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGyh2J3es=1OBEv1Dn46mkPa2vgz+xxqqTQhkEAxzqs_g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nFaG3cFFJXUnBTKp3fZCuRdacp8h/mCY/1stOdIEYPo=;
 b=X3gbAbWCgSAic3LKQPsnJI1Bpg6NFdmxDywOMA0BV05z474aqvJhf4TF7sy2YsceY4
 MCDvCp4+RN58VncaKZPmM4dH+Bz0mSlAh8l4Bre27FgLe4iEd/vhq0IqRWU60WJPL0Ky
 2OqxDKcnWqy8BJN8K6+9mrwXjkYUMHa0EnuZcxJl4+N2abuoKmGroVc3dYabMPysfY+5
 iPXBumNI2z3vhNJSkONAfmtCUKHH7cGCEHWUMBXLDKhtcEbeNaIVw1Wue/hk/Jqhz5BM
 CtRco/nstmzH5FLCLz/3sb5rIl0rru9v4k5clDVY3ttO4k/0P08QFkrJDr0G2dSoWnXF
 I7jQ==
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
Reply-To: christian.koenig@amd.com
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMTkgdW0gMTc6MDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgSnVu
IDI1LCAyMDE5IGF0IDQ6NDUgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEFtIDI1LjA2LjE5IHVtIDE2OjM1IHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoKPj4+IEhpIENocmlzdGlhbiwKPj4+Cj4+PiBPbiBUdWUsIEp1biAyNSwg
MjAxOSBhdCAwMjo0Njo0OVBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IE9u
IHRoZSBleHBvcnRlciBzaWRlIHdlIGFkZCBvcHRpb25hbCBleHBsaWNpdCBwaW5uaW5nIGNhbGxi
YWNrcy4gSWYgdGhvc2UKPj4+PiBjYWxsYmFja3MgYXJlIGltcGxlbWVudGVkIHRoZSBmcmFtZXdv
cmsgbm8gbG9uZ2VyIGNhY2hlcyBzZyB0YWJsZXMgYW5kIHRoZQo+Pj4+IG1hcC91bm1hcCBjYWxs
YmFja3MgYXJlIGFsd2F5cyBjYWxsZWQgd2l0aCB0aGUgbG9jayBvZiB0aGUgcmVzZXJ2YXRpb24g
b2JqZWN0Cj4+Pj4gaGVsZC4KPj4+Pgo+Pj4+IE9uIHRoZSBpbXBvcnRlciBzaWRlIHdlIGFkZCBh
biBvcHRpb25hbCBpbnZhbGlkYXRlIGNhbGxiYWNrLiBUaGlzIGNhbGxiYWNrIGlzCj4+Pj4gdXNl
ZCBieSB0aGUgZXhwb3J0ZXIgdG8gaW5mb3JtIHRoZSBpbXBvcnRlcnMgdGhhdCB0aGVpciBtYXBw
aW5ncyBzaG91bGQgYmUKPj4+PiBkZXN0cm95ZWQgYXMgc29vbiBhcyBwb3NzaWJsZS4KPj4+Pgo+
Pj4+IFRoaXMgYWxsb3dzIHRoZSBleHBvcnRlciB0byBwcm92aWRlIHRoZSBtYXBwaW5ncyB3aXRo
b3V0IHRoZSBuZWVkIHRvIHBpbgo+Pj4+IHRoZSBiYWNraW5nIHN0b3JlLgo+Pj4+Cj4+Pj4gdjI6
IGRvbid0IHRyeSB0byBpbnZhbGlkYXRlIG1hcHBpbmdzIHdoZW4gdGhlIGNhbGxiYWNrIGlzIE5V
TEwsCj4+Pj4gICAgICAgbG9jayB0aGUgcmVzZXJ2YXRpb24gb2JqIHdoaWxlIHVzaW5nIHRoZSBh
dHRhY2htZW50cywKPj4+PiAgICAgICBhZGQgaGVscGVyIHRvIHNldCB0aGUgY2FsbGJhY2sKPj4+
PiB2MzogbW92ZSBmbGFnIGZvciBpbnZhbGlkYXRpb24gc3VwcG9ydCBpbnRvIHRoZSBETUEtYnVm
LAo+Pj4+ICAgICAgIHVzZSBuZXcgYXR0YWNoX2luZm8gc3RydWN0dXJlIHRvIHNldCB0aGUgY2Fs
bGJhY2sKPj4+PiB2NDogdXNlIGltcG9ydGVyX3ByaXYgZmllbGQgaW5zdGVhZCBvZiBtYW5nbGlu
ZyBleHBvcnRlciBwcml2Lgo+Pj4+IHY1OiBkcm9wIGludmFsaWRhdGlvbl9zdXBwb3J0ZWQgZmxh
Zwo+Pj4+IHY2OiBzcXVhc2ggdG9nZXRoZXIgd2l0aCBwaW4vdW5waW4gY2hhbmdlcwo+Pj4+IHY3
OiBwaW4vdW5waW4gdGFrZXMgYW4gYXR0YWNobWVudCBub3cKPj4+PiB2ODogbnVrZSBkbWFfYnVm
X2F0dGFjaG1lbnRfKG1hcHx1bm1hcClfbG9ja2VkLAo+Pj4+ICAgICAgIGV2ZXJ5dGhpbmcgaXMg
bm93IGhhbmRsZWQgYmFja3dhcmQgY29tcGF0aWJsZQo+Pj4+IHY5OiBhbHdheXMgY2FjaGUgd2hl
biBleHBvcnQvaW1wb3J0ZXIgZG9uJ3QgYWdyZWUgb24gZHluYW1pYyBoYW5kbGluZwo+Pj4+IHYx
MDogbWluaW1hbCBzdHlsZSBjbGVhbnVwCj4+Pj4gdjExOiBkcm9wIGF1dG9tYXRpY2FsbHkgcmUt
ZW50cnkgYXZvaWRhbmNlCj4+Pj4gdjEyOiByZW5hbWUgY2FsbGJhY2sgdG8gbW92ZV9ub3RpZnkK
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwg
MTc5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4+Pj4gICAgaW5jbHVk
ZS9saW51eC9kbWEtYnVmLmggICB8IDEwOCArKysrKysrKysrKysrKysrKysrKystLQo+Pj4+ICAg
IDIgZmlsZXMgY2hhbmdlZCwgMjczIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Pj4+
Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jCj4+Pj4gaW5kZXggNmMxNWRlYjVkNGFkLi4yMTZmNzYxMDlmM2YgMTAw
NjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPj4+PiBAQCAtNTMxLDYgKzUzMSw5IEBAIHN0cnVjdCBkbWFf
YnVmICpkbWFfYnVmX2V4cG9ydChjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9leHBvcnRfaW5mbyAqZXhw
X2luZm8pCj4+Pj4gICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPj4+PiAg
ICAgICB9Cj4+Pj4KPj4+PiArICAgIGlmIChXQVJOX09OKGV4cF9pbmZvLT5vcHMtPmNhY2hlX3Nn
dF9tYXBwaW5nICYmIGV4cF9pbmZvLT5vcHMtPnBpbikpCj4+Pj4gKyAgICAgICAgICAgIHJldHVy
biBFUlJfUFRSKC1FSU5WQUwpOwo+Pj4+ICsKPj4+PiAgICAgICBpZiAoIXRyeV9tb2R1bGVfZ2V0
KGV4cF9pbmZvLT5vd25lcikpCj4+Pj4gICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5P
RU5UKTsKPj4+Pgo+Pj4+IEBAIC02NTEsMTAgKzY1NCwxMiBAQCB2b2lkIGRtYV9idWZfcHV0KHN0
cnVjdCBkbWFfYnVmICpkbWFidWYpCj4+Pj4gICAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl9w
dXQpOwo+Pj4+Cj4+Pj4gICAgLyoqCj4+Pj4gLSAqIGRtYV9idWZfYXR0YWNoIC0gQWRkIHRoZSBk
ZXZpY2UgdG8gZG1hX2J1ZidzIGF0dGFjaG1lbnRzIGxpc3Q7IG9wdGlvbmFsbHksCj4+Pj4gKyAq
IGRtYV9idWZfZHluYW1pY19hdHRhY2ggLSBBZGQgdGhlIGRldmljZSB0byBkbWFfYnVmJ3MgYXR0
YWNobWVudHMgbGlzdDsgb3B0aW9uYWxseSwKPj4+PiAgICAgKiBjYWxscyBhdHRhY2goKSBvZiBk
bWFfYnVmX29wcyB0byBhbGxvdyBkZXZpY2Utc3BlY2lmaWMgYXR0YWNoIGZ1bmN0aW9uYWxpdHkK
Pj4+PiAtICogQGRtYWJ1ZjogW2luXSAgICBidWZmZXIgdG8gYXR0YWNoIGRldmljZSB0by4KPj4+
PiAtICogQGRldjogICAgW2luXSAgICBkZXZpY2UgdG8gYmUgYXR0YWNoZWQuCj4+Pj4gKyAqIEBk
bWFidWY6ICAgICAgICAgW2luXSAgICBidWZmZXIgdG8gYXR0YWNoIGRldmljZSB0by4KPj4+PiAr
ICogQGRldjogICAgICAgICAgICBbaW5dICAgIGRldmljZSB0byBiZSBhdHRhY2hlZC4KPj4+PiAr
ICogQGltcG9ydGVyX29wcyAgICBbaW5dICAgIGltcG9ydGVyIG9wZXJhdGlvbnMgZm9yIHRoZSBh
dHRhY2htZW50Cj4+Pj4gKyAqIEBpbXBvcnRlcl9wcml2ICAgW2luXSAgICBpbXBvcnRlciBwcml2
YXRlIHBvaW50ZXIgZm9yIHRoZSBhdHRhY2htZW50Cj4+Pj4gICAgICoKPj4+PiAgICAgKiBSZXR1
cm5zIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgcG9pbnRlciBmb3IgdGhpcyBhdHRhY2htZW50
LiBBdHRhY2htZW50cwo+Pj4+ICAgICAqIG11c3QgYmUgY2xlYW5lZCB1cCBieSBjYWxsaW5nIGRt
YV9idWZfZGV0YWNoKCkuCj4+Pj4gQEAgLTY2OCw4ICs2NzMsMTAgQEAgRVhQT1JUX1NZTUJPTF9H
UEwoZG1hX2J1Zl9wdXQpOwo+Pj4+ICAgICAqIGFjY2Vzc2libGUgdG8gQGRldiwgYW5kIGNhbm5v
dCBiZSBtb3ZlZCB0byBhIG1vcmUgc3VpdGFibGUgcGxhY2UuIFRoaXMgaXMKPj4+PiAgICAgKiBp
bmRpY2F0ZWQgd2l0aCB0aGUgZXJyb3IgY29kZSAtRUJVU1kuCj4+Pj4gICAgICovCj4+Pj4gLXN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmRtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpk
bWFidWYsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRldmljZSAqZGV2KQo+Pj4+ICtzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICoKPj4+PiArZG1h
X2J1Zl9keW5hbWljX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9hdHRh
Y2hfb3BzICppbXBvcnRlcl9vcHMsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICB2b2lkICppbXBv
cnRlcl9wcml2KQo+Pj4+ICAgIHsKPj4+PiAgICAgICBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50
ICphdHRhY2g7Cj4+Pj4gICAgICAgaW50IHJldDsKPj4+PiBAQCAtNjgzLDYgKzY5MCw4IEBAIHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmRtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpk
bWFidWYsCj4+Pj4KPj4+PiAgICAgICBhdHRhY2gtPmRldiA9IGRldjsKPj4+PiAgICAgICBhdHRh
Y2gtPmRtYWJ1ZiA9IGRtYWJ1ZjsKPj4+PiArICAgIGF0dGFjaC0+aW1wb3J0ZXJfb3BzID0gaW1w
b3J0ZXJfb3BzOwo+Pj4+ICsgICAgYXR0YWNoLT5pbXBvcnRlcl9wcml2ID0gaW1wb3J0ZXJfcHJp
djsKPj4+Pgo+Pj4+ICAgICAgIG11dGV4X2xvY2soJmRtYWJ1Zi0+bG9jayk7Cj4+Pj4KPj4+PiBA
QCAtNjkxLDE2ICs3MDAsNzIgQEAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqZG1hX2J1Zl9h
dHRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwKPj4+PiAgICAgICAgICAgICAgIGlmIChyZXQp
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2F0dGFjaDsKPj4+PiAgICAgICB9
Cj4+Pj4gKyAgICByZXNlcnZhdGlvbl9vYmplY3RfbG9jayhkbWFidWYtPnJlc3YsIE5VTEwpOwo+
Pj4+ICAgICAgIGxpc3RfYWRkKCZhdHRhY2gtPm5vZGUsICZkbWFidWYtPmF0dGFjaG1lbnRzKTsK
Pj4+PiArICAgIHJlc2VydmF0aW9uX29iamVjdF91bmxvY2soZG1hYnVmLT5yZXN2KTsKPj4+Pgo+
Pj4+ICAgICAgIG11dGV4X3VubG9jaygmZG1hYnVmLT5sb2NrKTsKPj4+Pgo+Pj4+ICsgICAgLyog
V2hlbiBlaXRoZXIgdGhlIGltcG9ydGVyIG9yIHRoZSBleHBvcnRlciBjYW4ndCBoYW5kbGUgZHlu
YW1pYwo+Pj4+ICsgICAgICogbWFwcGluZ3Mgd2UgY2FjaGUgdGhlIG1hcHBpbmcgaGVyZSB0byBh
dm9pZCBpc3N1ZXMgd2l0aCB0aGUKPj4+PiArICAgICAqIHJlc2VydmF0aW9uIG9iamVjdCBsb2Nr
Lgo+Pj4+ICsgICAgICovCj4+Pj4gKyAgICBpZiAoZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFt
aWMoYXR0YWNoKSAhPQo+Pj4+ICsgICAgICAgIGRtYV9idWZfaXNfZHluYW1pYyhkbWFidWYpKSB7
Cj4+Pj4gKyAgICAgICAgICAgIHN0cnVjdCBzZ190YWJsZSAqc2d0Owo+Pj4+ICsKPj4+PiArICAg
ICAgICAgICAgaWYgKGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikpIHsKPj4+PiAr
ICAgICAgICAgICAgICAgICAgICByZXNlcnZhdGlvbl9vYmplY3RfbG9jayhhdHRhY2gtPmRtYWJ1
Zi0+cmVzdiwgTlVMTCk7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgcmV0ID0gZG1hX2J1Zl9w
aW4oYXR0YWNoKTsKPj4+PiArICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfdW5sb2NrOwo+Pj4+ICsgICAgICAgICAg
ICB9Cj4+Pj4gKwo+Pj4+ICsgICAgICAgICAgICBzZ3QgPSBkbWFidWYtPm9wcy0+bWFwX2RtYV9i
dWYoYXR0YWNoLCBETUFfQklESVJFQ1RJT05BTCk7Cj4+Pj4gKyAgICAgICAgICAgIGlmICghc2d0
KQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIHNndCA9IEVSUl9QVFIoLUVOT01FTSk7Cj4+Pj4g
KyAgICAgICAgICAgIGlmIChJU19FUlIoc2d0KSkgewo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
IHJldCA9IFBUUl9FUlIoc2d0KTsKPj4+PiArICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl91
bnBpbjsKPj4+PiArICAgICAgICAgICAgfQo+Pj4+ICsgICAgICAgICAgICBpZiAoZG1hX2J1Zl9p
c19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkKPj4+PiArICAgICAgICAgICAgICAgICAgICByZXNl
cnZhdGlvbl9vYmplY3RfdW5sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+PiArICAgICAg
ICAgICAgYXR0YWNoLT5zZ3QgPSBzZ3Q7Cj4+Pj4gKyAgICAgICAgICAgIGF0dGFjaC0+ZGlyID0g
RE1BX0JJRElSRUNUSU9OQUw7Cj4+Pj4gKyAgICB9Cj4+Pj4gKwo+Pj4+ICAgICAgIHJldHVybiBh
dHRhY2g7Cj4+Pj4KPj4+PiAgICBlcnJfYXR0YWNoOgo+Pj4+ICAgICAgIGtmcmVlKGF0dGFjaCk7
Cj4+Pj4gICAgICAgbXV0ZXhfdW5sb2NrKCZkbWFidWYtPmxvY2spOwo+Pj4+ICAgICAgIHJldHVy
biBFUlJfUFRSKHJldCk7Cj4+Pj4gKwo+Pj4+ICtlcnJfdW5waW46Cj4+Pj4gKyAgICBpZiAoZG1h
X2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkKPj4+PiArICAgICAgICAgICAgZG1hX2J1
Zl91bnBpbihhdHRhY2gpOwo+Pj4+ICsKPj4+PiArZXJyX3VubG9jazoKPj4+PiArICAgIGlmIChk
bWFfYnVmX2lzX2R5bmFtaWMoYXR0YWNoLT5kbWFidWYpKQo+Pj4+ICsgICAgICAgICAgICByZXNl
cnZhdGlvbl9vYmplY3RfdW5sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+PiArCj4+Pj4g
KyAgICBkbWFfYnVmX2RldGFjaChkbWFidWYsIGF0dGFjaCk7Cj4+Pj4gKyAgICByZXR1cm4gRVJS
X1BUUihyZXQpOwo+Pj4+ICt9Cj4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfZHluYW1p
Y19hdHRhY2gpOwo+Pj4+ICsKPj4+PiArLyoqCj4+Pj4gKyAqIGRtYV9idWZfYXR0YWNoIC0gV3Jh
cHBlciBmb3IgZG1hX2J1Zl9keW5hbWljX2F0dGFjaAo+Pj4+ICsgKiBAZG1hYnVmOiBbaW5dICAg
IGJ1ZmZlciB0byBhdHRhY2ggZGV2aWNlIHRvLgo+Pj4+ICsgKiBAZGV2OiAgICBbaW5dICAgIGRl
dmljZSB0byBiZSBhdHRhY2hlZC4KPj4+PiArICoKPj4+PiArICogV3JhcHBlciB0byBjYWxsIGRt
YV9idWZfZHluYW1pY19hdHRhY2goKSBmb3IgZHJpdmVycyB3aGljaCBzdGlsbCB1c2UgYSBzdGF0
aWMKPj4+PiArICogbWFwcGluZy4KPj4+PiArICovCj4+Pj4gK3N0cnVjdCBkbWFfYnVmX2F0dGFj
aG1lbnQgKmRtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2KQo+Pj4+
ICt7Cj4+Pj4gKyAgICByZXR1cm4gZG1hX2J1Zl9keW5hbWljX2F0dGFjaChkbWFidWYsIGRldiwg
TlVMTCwgTlVMTCk7Cj4+Pj4gICAgfQo+Pj4+ICAgIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZf
YXR0YWNoKTsKPj4+Pgo+Pj4+IEBAIC03MTcsMTEgKzc4MiwyMiBAQCB2b2lkIGRtYV9idWZfZGV0
YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0
dGFjaCkKPj4+PiAgICAgICBpZiAoV0FSTl9PTighZG1hYnVmIHx8ICFhdHRhY2gpKQo+Pj4+ICAg
ICAgICAgICAgICAgcmV0dXJuOwo+Pj4+Cj4+Pj4gLSAgICBpZiAoYXR0YWNoLT5zZ3QpCj4+Pj4g
KyAgICBpZiAoYXR0YWNoLT5zZ3QpIHsKPj4+PiArICAgICAgICAgICAgaWYgKGRtYV9idWZfaXNf
ZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgcmVzZXJ2
YXRpb25fb2JqZWN0X2xvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YsIE5VTEwpOwo+Pj4+ICsKPj4+
PiAgICAgICAgICAgICAgIGRtYWJ1Zi0+b3BzLT51bm1hcF9kbWFfYnVmKGF0dGFjaCwgYXR0YWNo
LT5zZ3QsIGF0dGFjaC0+ZGlyKTsKPj4+Pgo+Pj4+ICsgICAgICAgICAgICBpZiAoZG1hX2J1Zl9p
c19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkgewo+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGRt
YV9idWZfdW5waW4oYXR0YWNoKTsKPj4+PiArICAgICAgICAgICAgICAgICAgICByZXNlcnZhdGlv
bl9vYmplY3RfdW5sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+PiArICAgICAgICAgICAg
fQo+Pj4+ICsgICAgfQo+Pj4+ICsKPj4+PiAgICAgICBtdXRleF9sb2NrKCZkbWFidWYtPmxvY2sp
Owo+Pj4gVGltZSB0byBkaXRjaCBkbWFidWYtPmxvY2sgaW4gZmF2b3VyIG9mIHRoZSByZXNlcnZh
dGlvbiBvYmo/IFdlIGhhdmUgYQo+Pj4gZmFsbGJhY2sgcmVzdl9vYmogaW4gc3RydWN0IGRtYV9i
dWYgYWxyZWFkeSwgc28gdGhpcyBpcyBuZXZlciBudWxsLCBhbmQgSQo+Pj4gdGhpbmsgd291bGQg
Y2xlYW4gdXAgdGhlIGNvZGUgYSBiaXQuCj4+IFllYWgsIHRob3VnaHQgYWJvdXQgdGhhdCBhcyB3
ZWxsLiBCdXQgdGhlbiBkZWNpZGVkIGFnYWluc3QgaXQgZm9yIG5vdy4KPj4KPj4gS2V5IHBvaW50
IGlzIHRoYXQgZXhwb3J0ZXJzIGN1cnJlbnRseSBkb2Vzbid0IGNhcmUgYWJvdXQgZG1hYnVmLT5s
b2NrLAo+PiBidXQgdGhleSBkbyBjYXJlIGFib3V0IHRoZSByZXNlcnZhdGlvbiBsb2NrLgo+Pgo+
PiBTbyB3ZSB3aWxsIHByb2JhYmx5IGhhdmUgYSBidW5jaCBvZiBjYXNlcyB3aGVyZSB3ZSBoYXZl
IHRvIGZpeCB1cAo+PiBleHBvcnRlcnMgYmVjYXVzZSB0aGV5IHdpbGwgdHJ5IHRvIGdyYWIgdGhl
IHJlc2VydmF0aW9uIGxvY2sgYXMgd2VsbC4KPj4KPj4gT24gdGhlIG90aGVyIGhhbmQgd2UgbWF5
YmUgbm90IG5lZWQgYSBsb2NrIGF0IGFsbCBoZXJlIGlmIHdlIGp1c3QgY2FuCj4+IGxpdmUgd2l0
aCBtdWx0aXBsZSBhdHRhY2gvZGV0YWNoIGNhbGxiYWNrcyBydW5uaW5nIGluIHBhcmFsbGVsLgo+
IFdlbGwgbG9va2luZyB0aHJvdWdoIHRoZSBjb2RlIEkgdGhvdWdodCB0aGF0IGFsbCB0aGUgcGxh
Y2VzIHlvdSBncmFiCj4gZG1hYnVmLT5yZXN2IHdlIGFsc28gZ3JhYiBkbWFidWYtPmxvY2ssIHNv
IHNlZW1lZCBmdWxseSByZWR1bmRhbnQuIEJ1dAo+IEkgZGlkbid0IGNoZWNrIGNvbXBsZXRlbHku
CgpUaGUgZGlmZmVyZW5jZSBpcyB0aGF0IEkgZGlkbid0IGNhbGwgYXR0YWNoL2RldGFjaCB3aXRo
IHRoZSBsb2NrIGhlbGQgeWV0LgoKQW5kIHdlIGNvdWxkIGFjdHVhbGx5IGRyb3AgbG9ja2luZyB0
aGUgcmVzZXJ2YXRpb24gb2JqZWN0IHdoaWxlIAptYW5pcHVsYXRpbmcgdGhlIGxpc3Qgb2YgYXR0
YWNobWVudHMgc2luY2Ugd2Ugbm8gbG9uZ2VyIHVzZSB0aGF0IHdvcmthcm91bmQuCgpHb2luZyB0
byBmaXggdGhhdCB1cCB0b21vcnJvdyBhcyB3ZWxsLApDaHJpc3RpYW4uCgo+Cj4+Pgo+Pj4+ICsg
ICAgcmVzZXJ2YXRpb25fb2JqZWN0X2xvY2soZG1hYnVmLT5yZXN2LCBOVUxMKTsKPj4+PiAgICAg
ICBsaXN0X2RlbCgmYXR0YWNoLT5ub2RlKTsKPj4+PiArICAgIHJlc2VydmF0aW9uX29iamVjdF91
bmxvY2soZG1hYnVmLT5yZXN2KTsKPj4+PiAgICAgICBpZiAoZG1hYnVmLT5vcHMtPmRldGFjaCkK
Pj4+PiAgICAgICAgICAgICAgIGRtYWJ1Zi0+b3BzLT5kZXRhY2goZG1hYnVmLCBhdHRhY2gpOwo+
Pj4+Cj4+Pj4gQEAgLTczMCw2ICs4MDYsNDQgQEAgdm9pZCBkbWFfYnVmX2RldGFjaChzdHJ1Y3Qg
ZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpCj4+Pj4g
ICAgfQo+Pj4+ICAgIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfZGV0YWNoKTsKPj4+Pgo+Pj4+
ICsvKioKPj4+PiArICogZG1hX2J1Zl9waW4gLSBMb2NrIGRvd24gdGhlIERNQS1idWYKPj4+PiAr
ICoKPj4+PiArICogQGF0dGFjaDogW2luXSAgICBhdHRhY2htZW50IHdoaWNoIHNob3VsZCBiZSBw
aW5uZWQKPj4+PiArICoKPj4+PiArICogUmV0dXJuczoKPj4+PiArICogMCBvbiBzdWNjZXNzLCBu
ZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCj4+Pj4gKyAqLwo+Pj4+ICtpbnQgZG1hX2J1
Zl9waW4oc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQo+Pj4+ICt7Cj4+Pj4gKyAg
ICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmID0gYXR0YWNoLT5kbWFidWY7Cj4+Pj4gKyAgICBpbnQg
cmV0ID0gMDsKPj4+PiArCj4+Pj4gKyAgICByZXNlcnZhdGlvbl9vYmplY3RfYXNzZXJ0X2hlbGQo
ZG1hYnVmLT5yZXN2KTsKPj4+PiArCj4+Pj4gKyAgICBpZiAoZG1hYnVmLT5vcHMtPnBpbikKPj4+
PiArICAgICAgICAgICAgcmV0ID0gZG1hYnVmLT5vcHMtPnBpbihhdHRhY2gpOwo+Pj4+ICsKPj4+
PiArICAgIHJldHVybiByZXQ7Cj4+Pj4gK30KPj4+PiArRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1
Zl9waW4pOwo+Pj4+ICsKPj4+PiArLyoqCj4+Pj4gKyAqIGRtYV9idWZfdW5waW4gLSBSZW1vdmUg
bG9jayBmcm9tIERNQS1idWYKPj4+PiArICoKPj4+PiArICogQGF0dGFjaDogW2luXSAgICBhdHRh
Y2htZW50IHdoaWNoIHNob3VsZCBiZSB1bnBpbm5lZAo+Pj4+ICsgKi8KPj4+PiArdm9pZCBkbWFf
YnVmX3VucGluKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCkKPj4+PiArewo+Pj4+
ICsgICAgc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiA9IGF0dGFjaC0+ZG1hYnVmOwo+Pj4+ICsKPj4+
PiArICAgIHJlc2VydmF0aW9uX29iamVjdF9hc3NlcnRfaGVsZChkbWFidWYtPnJlc3YpOwo+Pj4+
ICsKPj4+PiArICAgIGlmIChkbWFidWYtPm9wcy0+dW5waW4pCj4+Pj4gKyAgICAgICAgICAgIGRt
YWJ1Zi0+b3BzLT51bnBpbihhdHRhY2gpOwo+Pj4+ICt9Cj4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BM
KGRtYV9idWZfdW5waW4pOwo+Pj4+ICsKPj4+PiAgICAvKioKPj4+PiAgICAgKiBkbWFfYnVmX21h
cF9hdHRhY2htZW50IC0gUmV0dXJucyB0aGUgc2NhdHRlcmxpc3QgdGFibGUgb2YgdGhlIGF0dGFj
aG1lbnQ7Cj4+Pj4gICAgICogbWFwcGVkIGludG8gX2RldmljZV8gYWRkcmVzcyBzcGFjZS4gSXMg
YSB3cmFwcGVyIGZvciBtYXBfZG1hX2J1ZigpIG9mIHRoZQo+Pj4+IEBAIC03NDksNiArODYzLDcg
QEAgc3RydWN0IHNnX3RhYmxlICpkbWFfYnVmX21hcF9hdHRhY2htZW50KHN0cnVjdCBkbWFfYnVm
X2F0dGFjaG1lbnQgKmF0dGFjaCwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKPj4+PiAgICB7Cj4+Pj4g
ICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ190YWJsZTsKPj4+PiArICAgIGludCByOwo+Pj4+Cj4+
Pj4gICAgICAgbWlnaHRfc2xlZXAoKTsKPj4+Pgo+Pj4+IEBAIC03NjcsMTAgKzg4MiwyOSBAQCBz
dHJ1Y3Qgc2dfdGFibGUgKmRtYV9idWZfbWFwX2F0dGFjaG1lbnQoc3RydWN0IGRtYV9idWZfYXR0
YWNobWVudCAqYXR0YWNoLAo+Pj4+ICAgICAgICAgICAgICAgcmV0dXJuIGF0dGFjaC0+c2d0Owo+
Pj4+ICAgICAgIH0KPj4+Pgo+Pj4+ICsgICAgaWYgKGRtYV9idWZfYXR0YWNobWVudF9pc19keW5h
bWljKGF0dGFjaCkpIHsKPj4+PiArICAgICAgICAgICAgcmVzZXJ2YXRpb25fb2JqZWN0X2Fzc2Vy
dF9oZWxkKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+PiArCj4+Pj4gKyAgICB9IGVsc2UgaWYg
KGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikpIHsKPj4+PiArICAgICAgICAgICAg
cmVzZXJ2YXRpb25fb2JqZWN0X2xvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YsIE5VTEwpOwo+Pj4+
ICsgICAgICAgICAgICByID0gZG1hX2J1Zl9waW4oYXR0YWNoKTsKPj4+PiArICAgICAgICAgICAg
aWYgKHIpIHsKPj4+PiArICAgICAgICAgICAgICAgICAgICByZXNlcnZhdGlvbl9vYmplY3RfdW5s
b2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+PiArICAgICAgICAgICAgICAgICAgICByZXR1
cm4gRVJSX1BUUihyKTsKPj4+PiArICAgICAgICAgICAgfQo+Pj4+ICsgICAgfQo+Pj4gV2l0aCB0
aGlzIGRlc2lnbiAoYmVjYXVzZSB3ZSBjYW4ndCBjYWNoZSBhdCBhdHRhY2ggdGltZSB1bmNvbmRp
dGlvbmFsbHkpCj4+PiB3ZSBpbmZsaWN0IHRoZSByZXNlcnZhdGlvbiBsb2NrIG9uIGFsbCBpbXBv
cnRlcnMuIFNvIG5lZWRzOgo+Pj4KPj4+ICAgICAgICB9IGVsc2Ugewo+Pj4gICAgICAgICAgICAg
ICAgLyogbmVpdGhlciBpbXBvcnRlciBub3IgZXhwb3J0ZXIgYXJlIGR5bmFtaWNlICovCj4+PiAg
ICAgICAgICAgICAgICBtaWdodF9sb2NrKGRtYWJ1Zi0+cmVzdi0+d3dfbXV0ZXgpOwo+Pj4gICAg
ICAgIH0KPj4+Cj4+PiBTYW1lIGZvciBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQuCj4+IEdvb2Qg
aWRlYS4KPj4KPj4+IEkgYWxzbyBleHBlY3QgdGhhdCB0aGlzIHdpbGwgYmxvdyB1cCBpbiBpbnRl
bC1nZngtY2kgOi0vIEkgZGlkIGxvb2sgYXQKPj4+IHByZXZpb3VzIGludGVsLWdmeC1jaSBydW5z
IG9mIHlvdXIgc2VyaWVzLCBhbmQgdGhlIGxhc3Qgb25lIHRoYXQgZGlkIHBhc3MKPj4+IHdhcyB0
aGUgb25lIHRoYXQgc3RpbGwgaGFkIHRoZSBjYWNoaW5nIGluIF9hdHRhY2goKToKPj4gV2VsbCBh
cyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBjdXJyZW50IG9uZSBwYXNzZXMgYXMgd2VsbC4gQWN0dWFs
bHkganVzdAo+PiByZWNlbnRseSBmb3VuZCBhIHR5cG8gYmVjYXVzZSBvZiB0aGlzLgo+IEhtIGlu
ZGVlZCB0aGUgYW1kL2k5MTUgcHJpbWUgdGVzdHMgYXJlIHN0aWxsIGluIEJBVCBhbmQgdGhhdCBw
YXNzZWQuCj4gSSdtIHN1cnByaXNlZC4gTWF5YmUgQ2hyaXMgV2lsc29uIG1vdmVkIGFsb25nIHF1
aXRlIGEgbG90IHdpdGggb3VyCj4gbG9ja2luZyByZXdvcmsgYW5kIGk5MTUgaXNuJ3QgdGhlIGJh
ZCBvbmUgb3V0IGFueW1vcmUuCj4KPj4+IEdlZXogSSB3YXMgc29vb29vb29vbyBsb2NraW5nIGZv
cndhcmQgdG8gc2xhcHBpbmcgYW4gci1iIG9uIHRoaXMgYW5kCj4+PiB2b2x1bnRlZXJpbmcgbXlz
ZWxmIHRvIHBvbGlzaCB0aGUga2VybmVsZG9jICh3aGljaCBpc24ndCBncmVhdCwgYnV0IGFsc28K
Pj4+IHByZS1leGlzdGluZyBjb25kaXRpb24gcGx1cyBvbiBteSB0b2RvIGxpc3QgYW55d2F5KSA6
LSgKPj4gR29pbmcgdG8gYWRkIHRoZSBtaWdodF9sb2NrIGFuZCBzZW5kIGFnYWluLCBsZXQncyBz
ZWUgd2hhdCBpbnRlbC1nZngtY2kKPj4gaGFzIHNheSB0byB0aGlzLgo+IFllYWggdGhhdCBzaG91
bGQgYXQgbGVhc3QgaW5jcmVhc2UgdGhlIGNoYW5jZXMgd2UncmUgc2VlaW5nIHNvbWV0aGluZy4K
PiBPZmMgaW50ZWwtZ2Z4LWNpIGRvZXNuJ3QgdGVzdCBldmVyeXRoaW5nIDotKQo+IC1EYW5pZWwK
Pgo+PiBDaHJpc3RpYW4uCj4+Cj4+Pj4gKwo+Pj4+ICAgICAgIHNnX3RhYmxlID0gYXR0YWNoLT5k
bWFidWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0YWNoLCBkaXJlY3Rpb24pOwo+Pj4+ICAgICAgIGlm
ICghc2dfdGFibGUpCj4+Pj4gICAgICAgICAgICAgICBzZ190YWJsZSA9IEVSUl9QVFIoLUVOT01F
TSk7Cj4+Pj4KPj4+PiArICAgIGlmICghZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoYXR0
YWNoKSAmJgo+Pj4+ICsgICAgICAgIGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1Zikp
IHsKPj4+PiArICAgICAgICAgICAgaWYgKElTX0VSUihzZ190YWJsZSkpCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgZG1hX2J1Zl91bnBpbihhdHRhY2gpOwo+Pj4+ICsgICAgICAgICAgICByZXNl
cnZhdGlvbl9vYmplY3RfdW5sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+PiArICAgIH0K
Pj4+PiArCj4+Pj4gICAgICAgaWYgKCFJU19FUlIoc2dfdGFibGUpICYmIGF0dGFjaC0+ZG1hYnVm
LT5vcHMtPmNhY2hlX3NndF9tYXBwaW5nKSB7Cj4+Pj4gICAgICAgICAgICAgICBhdHRhY2gtPnNn
dCA9IHNnX3RhYmxlOwo+Pj4+ICAgICAgICAgICAgICAgYXR0YWNoLT5kaXIgPSBkaXJlY3Rpb247
Cj4+Pj4gQEAgLTgwMiwxMCArOTM2LDQxIEBAIHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50
KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKPj4+PiAgICAgICBpZiAoYXR0YWNo
LT5zZ3QgPT0gc2dfdGFibGUpCj4+Pj4gICAgICAgICAgICAgICByZXR1cm47Cj4+Pj4KPj4+PiAr
ICAgIGlmIChkbWFfYnVmX2F0dGFjaG1lbnRfaXNfZHluYW1pYyhhdHRhY2gpKQo+Pj4+ICsgICAg
ICAgICAgICByZXNlcnZhdGlvbl9vYmplY3RfYXNzZXJ0X2hlbGQoYXR0YWNoLT5kbWFidWYtPnJl
c3YpOwo+Pj4+ICsgICAgZWxzZSBpZiAoZG1hX2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVm
KSkKPj4+PiArICAgICAgICAgICAgcmVzZXJ2YXRpb25fb2JqZWN0X2xvY2soYXR0YWNoLT5kbWFi
dWYtPnJlc3YsIE5VTEwpOwo+Pj4+ICsKPj4+PiAgICAgICBhdHRhY2gtPmRtYWJ1Zi0+b3BzLT51
bm1hcF9kbWFfYnVmKGF0dGFjaCwgc2dfdGFibGUsIGRpcmVjdGlvbik7Cj4+Pj4gKwo+Pj4+ICsg
ICAgaWYgKGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikgJiYKPj4+PiArICAgICAg
ICAhZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoYXR0YWNoKSkgewo+Pj4+ICsgICAgICAg
ICAgICBkbWFfYnVmX3VucGluKGF0dGFjaCk7Cj4+Pj4gKyAgICAgICAgICAgIHJlc2VydmF0aW9u
X29iamVjdF91bmxvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+Pj4+ICsgICAgfQo+Pj4+ICAg
IH0KPj4+PiAgICBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQpOwo+
Pj4+Cj4+Pj4gKy8qKgo+Pj4+ICsgKiBkbWFfYnVmX21vdmVfbm90aWZ5IC0gbm90aWZ5IGF0dGFj
aG1lbnRzIHRoYXQgRE1BLWJ1ZiBpcyBtb3ZpbmcKPj4+PiArICoKPj4+PiArICogQGRtYWJ1Zjog
W2luXSAgICBidWZmZXIgd2hpY2ggaXMgbW92aW5nCj4+Pj4gKyAqCj4+Pj4gKyAqIEluZm9ybXMg
YWxsIGF0dGFjaG1lbnN0IHRoYXQgdGhleSBuZWVkIHRvIGRlc3Ryb3kgYW5kIHJlY3JlYXRlZCBh
bGwgdGhlaXIKPj4+PiArICogbWFwcGluZ3MuCj4+Pj4gKyAqLwo+Pj4+ICt2b2lkIGRtYV9idWZf
bW92ZV9ub3RpZnkoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikKPj4+PiArewo+Pj4+ICsgICAgc3Ry
dWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoOwo+Pj4+ICsKPj4+PiArICAgIHJlc2VydmF0
aW9uX29iamVjdF9hc3NlcnRfaGVsZChkbWFidWYtPnJlc3YpOwo+Pj4+ICsKPj4+PiArICAgIGxp
c3RfZm9yX2VhY2hfZW50cnkoYXR0YWNoLCAmZG1hYnVmLT5hdHRhY2htZW50cywgbm9kZSkKPj4+
PiArICAgICAgICAgICAgaWYgKGF0dGFjaC0+aW1wb3J0ZXJfb3BzICYmIGF0dGFjaC0+aW1wb3J0
ZXJfb3BzLT5tb3ZlX25vdGlmeSkKPj4+PiArICAgICAgICAgICAgICAgICAgICBhdHRhY2gtPmlt
cG9ydGVyX29wcy0+bW92ZV9ub3RpZnkoYXR0YWNoKTsKPj4+PiArfQo+Pj4+ICtFWFBPUlRfU1lN
Qk9MX0dQTChkbWFfYnVmX21vdmVfbm90aWZ5KTsKPj4+PiArCj4+Pj4gICAgLyoqCj4+Pj4gICAg
ICogRE9DOiBjcHUgYWNjZXNzCj4+Pj4gICAgICoKPj4+PiBAQCAtMTIyNSwxMCArMTM5MCwxMiBA
QCBzdGF0aWMgaW50IGRtYV9idWZfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQg
KnVudXNlZCkKPj4+PiAgICAgICAgICAgICAgIHNlcV9wdXRzKHMsICJcdEF0dGFjaGVkIERldmlj
ZXM6XG4iKTsKPj4+PiAgICAgICAgICAgICAgIGF0dGFjaF9jb3VudCA9IDA7Cj4+Pj4KPj4+PiAr
ICAgICAgICAgICAgcmVzZXJ2YXRpb25fb2JqZWN0X2xvY2soYnVmX29iai0+cmVzdiwgTlVMTCk7
Cj4+Pj4gICAgICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KGF0dGFjaF9vYmosICZidWZf
b2JqLT5hdHRhY2htZW50cywgbm9kZSkgewo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBzZXFf
cHJpbnRmKHMsICJcdCVzXG4iLCBkZXZfbmFtZShhdHRhY2hfb2JqLT5kZXYpKTsKPj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgYXR0YWNoX2NvdW50Kys7Cj4+Pj4gICAgICAgICAgICAgICB9Cj4+
Pj4gKyAgICAgICAgICAgIHJlc2VydmF0aW9uX29iamVjdF91bmxvY2soYnVmX29iai0+cmVzdik7
Cj4+PiBZZWFoIGRlZmluaXRlbHkgdGltZSB0byByZXRpcmUgZG1hYnVmLT5sb2NrIEkgdGhpbmsu
Cj4+Pgo+Pj4gQ2hlZXJzLCBEYW5pZWwKPj4+Cj4+Pj4gICAgICAgICAgICAgICBzZXFfcHJpbnRm
KHMsICJUb3RhbCAlZCBkZXZpY2VzIGF0dGFjaGVkXG5cbiIsCj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYXR0YWNoX2NvdW50KTsKPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9kbWEtYnVmLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+Pj4+IGluZGV4IDAxYWQ1
Yjk0MmE2Zi4uY2NhZDJmYzFmNjQwIDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1h
LWJ1Zi5oCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPj4+PiBAQCAtOTIsMTQg
KzkyLDQwIEBAIHN0cnVjdCBkbWFfYnVmX29wcyB7Cj4+Pj4gICAgICAgICovCj4+Pj4gICAgICAg
dm9pZCAoKmRldGFjaCkoc3RydWN0IGRtYV9idWYgKiwgc3RydWN0IGRtYV9idWZfYXR0YWNobWVu
dCAqKTsKPj4+Pgo+Pj4+ICsgICAgLyoqCj4+Pj4gKyAgICAgKiBAcGluOgo+Pj4+ICsgICAgICoK
Pj4+PiArICAgICAqIFRoaXMgaXMgY2FsbGVkIGJ5IGRtYV9idWZfcGluIGFuZCBsZXRzIHRoZSBl
eHBvcnRlciBrbm93IHRoYXQgdGhlCj4+Pj4gKyAgICAgKiBETUEtYnVmIGNhbid0IGJlIG1vdmVk
IGFueSBtb3JlLgo+Pj4+ICsgICAgICoKPj4+PiArICAgICAqIFRoaXMgaXMgY2FsbGVkIHdpdGgg
dGhlIGRtYWJ1Zi0+cmVzdiBvYmplY3QgbG9ja2VkLgo+Pj4+ICsgICAgICoKPj4+PiArICAgICAq
IFRoaXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCj4+Pj4gKyAgICAgKgo+Pj4+ICsgICAgICogUmV0
dXJuczoKPj4+PiArICAgICAqCj4+Pj4gKyAgICAgKiAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVy
cm9yIGNvZGUgb24gZmFpbHVyZS4KPj4+PiArICAgICAqLwo+Pj4+ICsgICAgaW50ICgqcGluKShz
dHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpOwo+Pj4+ICsKPj4+PiArICAgIC8qKgo+
Pj4+ICsgICAgICogQHVucGluOgo+Pj4+ICsgICAgICoKPj4+PiArICAgICAqIFRoaXMgaXMgY2Fs
bGVkIGJ5IGRtYV9idWZfdW5waW4gYW5kIGxldHMgdGhlIGV4cG9ydGVyIGtub3cgdGhhdCB0aGUK
Pj4+PiArICAgICAqIERNQS1idWYgY2FuIGJlIG1vdmVkIGFnYWluLgo+Pj4+ICsgICAgICoKPj4+
PiArICAgICAqIFRoaXMgaXMgY2FsbGVkIHdpdGggdGhlIGRtYWJ1Zi0+cmVzdiBvYmplY3QgbG9j
a2VkLgo+Pj4+ICsgICAgICoKPj4+PiArICAgICAqIFRoaXMgY2FsbGJhY2sgaXMgb3B0aW9uYWwu
Cj4+Pj4gKyAgICAgKi8KPj4+PiArICAgIHZvaWQgKCp1bnBpbikoc3RydWN0IGRtYV9idWZfYXR0
YWNobWVudCAqYXR0YWNoKTsKPj4+PiArCj4+Pj4gICAgICAgLyoqCj4+Pj4gICAgICAgICogQG1h
cF9kbWFfYnVmOgo+Pj4+ICAgICAgICAqCj4+Pj4gICAgICAgICogVGhpcyBpcyBjYWxsZWQgYnkg
ZG1hX2J1Zl9tYXBfYXR0YWNobWVudCgpIGFuZCBpcyB1c2VkIHRvIG1hcCBhCj4+Pj4gICAgICAg
ICogc2hhcmVkICZkbWFfYnVmIGludG8gZGV2aWNlIGFkZHJlc3Mgc3BhY2UsIGFuZCBpdCBpcyBt
YW5kYXRvcnkuIEl0Cj4+Pj4gLSAgICAgKiBjYW4gb25seSBiZSBjYWxsZWQgaWYgQGF0dGFjaCBo
YXMgYmVlbiBjYWxsZWQgc3VjY2Vzc2Z1bGx5LiBUaGlzCj4+Pj4gLSAgICAgKiBlc3NlbnRpYWxs
eSBwaW5zIHRoZSBETUEgYnVmZmVyIGludG8gcGxhY2UsIGFuZCBpdCBjYW5ub3QgYmUgbW92ZWQK
Pj4+PiAtICAgICAqIGFueSBtb3JlCj4+Pj4gKyAgICAgKiBjYW4gb25seSBiZSBjYWxsZWQgaWYg
QGF0dGFjaCBoYXMgYmVlbiBjYWxsZWQgc3VjY2Vzc2Z1bGx5Lgo+Pj4+ICAgICAgICAqCj4+Pj4g
ICAgICAgICogVGhpcyBjYWxsIG1heSBzbGVlcCwgZS5nLiB3aGVuIHRoZSBiYWNraW5nIHN0b3Jh
Z2UgZmlyc3QgbmVlZHMgdG8gYmUKPj4+PiAgICAgICAgKiBhbGxvY2F0ZWQsIG9yIG1vdmVkIHRv
IGEgbG9jYXRpb24gc3VpdGFibGUgZm9yIGFsbCBjdXJyZW50bHkgYXR0YWNoZWQKPj4+PiBAQCAt
MTIwLDYgKzE0Niw5IEBAIHN0cnVjdCBkbWFfYnVmX29wcyB7Cj4+Pj4gICAgICAgICogYW55IG90
aGVyIGtpbmQgb2Ygc2hhcmluZyB0aGF0IHRoZSBleHBvcnRlciBtaWdodCB3aXNoIHRvIG1ha2UK
Pj4+PiAgICAgICAgKiBhdmFpbGFibGUgdG8gYnVmZmVyLXVzZXJzLgo+Pj4+ICAgICAgICAqCj4+
Pj4gKyAgICAgKiBUaGlzIGlzIGFsd2F5cyBjYWxsZWQgd2l0aCB0aGUgZG1hYnVmLT5yZXN2IG9i
amVjdCBsb2NrZWQgd2hlbgo+Pj4+ICsgICAgICogdGhlIHBpbi91bnBpbiBjYWxsYmFja3MgYXJl
IGltcGxlbWVudGVkLgo+Pj4+ICsgICAgICoKPj4+PiAgICAgICAgKiBSZXR1cm5zOgo+Pj4+ICAg
ICAgICAqCj4+Pj4gICAgICAgICogQSAmc2dfdGFibGUgc2NhdHRlciBsaXN0IG9mIG9yIHRoZSBi
YWNraW5nIHN0b3JhZ2Ugb2YgdGhlIERNQSBidWZmZXIsCj4+Pj4gQEAgLTEzNyw5ICsxNjYsNiBA
QCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgewo+Pj4+ICAgICAgICAqCj4+Pj4gICAgICAgICogVGhpcyBp
cyBjYWxsZWQgYnkgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KCkgYW5kIHNob3VsZCB1bm1hcCBh
bmQKPj4+PiAgICAgICAgKiByZWxlYXNlIHRoZSAmc2dfdGFibGUgYWxsb2NhdGVkIGluIEBtYXBf
ZG1hX2J1ZiwgYW5kIGl0IGlzIG1hbmRhdG9yeS4KPj4+PiAtICAgICAqIEl0IHNob3VsZCBhbHNv
IHVucGluIHRoZSBiYWNraW5nIHN0b3JhZ2UgaWYgdGhpcyBpcyB0aGUgbGFzdCBtYXBwaW5nCj4+
Pj4gLSAgICAgKiBvZiB0aGUgRE1BIGJ1ZmZlciwgaXQgdGhlIGV4cG9ydGVyIHN1cHBvcnRzIGJh
Y2tpbmcgc3RvcmFnZQo+Pj4+IC0gICAgICogbWlncmF0aW9uLgo+Pj4+ICAgICAgICAqLwo+Pj4+
ICAgICAgIHZvaWQgKCp1bm1hcF9kbWFfYnVmKShzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICos
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzZ190YWJsZSAqLAo+Pj4+
IEBAIC0zMzAsNiArMzU2LDM0IEBAIHN0cnVjdCBkbWFfYnVmIHsKPj4+PiAgICAgICB9IGNiX2V4
Y2wsIGNiX3NoYXJlZDsKPj4+PiAgICB9Owo+Pj4+Cj4+Pj4gKy8qKgo+Pj4+ICsgKiBzdHJ1Y3Qg
ZG1hX2J1Zl9hdHRhY2hfb3BzIC0gaW1wb3J0ZXIgb3BlcmF0aW9ucyBmb3IgYW4gYXR0YWNobWVu
dAo+Pj4+ICsgKiBAbW92ZV9ub3RpZnk6IFtvcHRpb25hbF0gbm90aWZpY2F0aW9uIHRoYXQgdGhl
IERNQS1idWYgaXMgbW92aW5nCj4+Pj4gKyAqCj4+Pj4gKyAqIEF0dGFjaG1lbnQgb3BlcmF0aW9u
cyBpbXBsZW1lbnRlZCBieSB0aGUgaW1wb3J0ZXIuCj4+Pj4gKyAqLwo+Pj4+ICtzdHJ1Y3QgZG1h
X2J1Zl9hdHRhY2hfb3BzIHsKPj4+PiArICAgIC8qKgo+Pj4+ICsgICAgICogQG1vdmVfbm90aWZ5
Cj4+Pj4gKyAgICAgKgo+Pj4+ICsgICAgICogSWYgdGhpcyBjYWxsYmFjayBpcyBwcm92aWRlZCB0
aGUgZnJhbWV3b3JrIGNhbiBhdm9pZCBwaW5uaW5nIHRoZQo+Pj4+ICsgICAgICogYmFja2luZyBz
dG9yZSB3aGlsZSBtYXBwaW5ncyBleGlzdHMuCj4+Pj4gKyAgICAgKgo+Pj4+ICsgICAgICogVGhp
cyBjYWxsYmFjayBpcyBjYWxsZWQgd2l0aCB0aGUgbG9jayBvZiB0aGUgcmVzZXJ2YXRpb24gb2Jq
ZWN0Cj4+Pj4gKyAgICAgKiBhc3NvY2lhdGVkIHdpdGggdGhlIGRtYV9idWYgaGVsZCBhbmQgdGhl
IG1hcHBpbmcgZnVuY3Rpb24gbXVzdCBiZQo+Pj4+ICsgICAgICogY2FsbGVkIHdpdGggdGhpcyBs
b2NrIGhlbGQgYXMgd2VsbC4gVGhpcyBtYWtlcyBzdXJlIHRoYXQgbm8gbWFwcGluZwo+Pj4+ICsg
ICAgICogaXMgY3JlYXRlZCBjb25jdXJyZW50bHkgd2l0aCBhbiBvbmdvaW5nIG1vdmUgb3BlcmF0
aW9uLgo+Pj4+ICsgICAgICoKPj4+PiArICAgICAqIE1hcHBpbmdzIHN0YXkgdmFsaWQgYW5kIGFy
ZSBub3QgZGlyZWN0bHkgYWZmZWN0ZWQgYnkgdGhpcyBjYWxsYmFjay4KPj4+PiArICAgICAqIEJ1
dCB0aGUgRE1BLWJ1ZiBjYW4gbm93IGJlIGluIGEgZGlmZmVyZW50IHBoeXNpY2FsIGxvY2F0aW9u
LCBzbyBhbGwKPj4+PiArICAgICAqIG1hcHBpbmdzIHNob3VsZCBiZSBkZXN0cm95ZWQgYW5kIHJl
LWNyZWF0ZWQgYXMgc29vbiBhcyBwb3NzaWJsZS4KPj4+PiArICAgICAqCj4+Pj4gKyAgICAgKiBO
ZXcgbWFwcGluZ3MgY2FuIGJlIGNyZWF0ZWQgYWZ0ZXIgdGhpcyBjYWxsYmFjayByZXR1cm5zLCBh
bmQgd2lsbAo+Pj4+ICsgICAgICogcG9pbnQgdG8gdGhlIG5ldyBsb2NhdGlvbiBvZiB0aGUgRE1B
LWJ1Zi4KPj4+PiArICAgICAqLwo+Pj4+ICsgICAgdm9pZCAoKm1vdmVfbm90aWZ5KShzdHJ1Y3Qg
ZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpOwo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiAgICAvKioK
Pj4+PiAgICAgKiBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50IC0gaG9sZHMgZGV2aWNlLWJ1ZmZl
ciBhdHRhY2htZW50IGRhdGEKPj4+PiAgICAgKiBAZG1hYnVmOiBidWZmZXIgZm9yIHRoaXMgYXR0
YWNobWVudC4KPj4+PiBAQCAtMzM4LDYgKzM5Miw4IEBAIHN0cnVjdCBkbWFfYnVmIHsKPj4+PiAg
ICAgKiBAc2d0OiBjYWNoZWQgbWFwcGluZy4KPj4+PiAgICAgKiBAZGlyOiBkaXJlY3Rpb24gb2Yg
Y2FjaGVkIG1hcHBpbmcuCj4+Pj4gICAgICogQHByaXY6IGV4cG9ydGVyIHNwZWNpZmljIGF0dGFj
aG1lbnQgZGF0YS4KPj4+PiArICogQGltcG9ydGVyX29wczogaW1wb3J0ZXIgb3BlcmF0aW9ucyBm
b3IgdGhpcyBhdHRhY2htZW50Lgo+Pj4+ICsgKiBAaW1wb3J0ZXJfcHJpdjogaW1wb3J0ZXIgc3Bl
Y2lmaWMgYXR0YWNobWVudCBkYXRhLgo+Pj4+ICAgICAqCj4+Pj4gICAgICogVGhpcyBzdHJ1Y3R1
cmUgaG9sZHMgdGhlIGF0dGFjaG1lbnQgaW5mb3JtYXRpb24gYmV0d2VlbiB0aGUgZG1hX2J1ZiBi
dWZmZXIKPj4+PiAgICAgKiBhbmQgaXRzIHVzZXIgZGV2aWNlKHMpLiBUaGUgbGlzdCBjb250YWlu
cyBvbmUgYXR0YWNobWVudCBzdHJ1Y3QgcGVyIGRldmljZQo+Pj4+IEBAIC0zNTUsNiArNDExLDkg
QEAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCB7Cj4+Pj4gICAgICAgc3RydWN0IHNnX3RhYmxl
ICpzZ3Q7Cj4+Pj4gICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyOwo+Pj4+ICAgICAg
IHZvaWQgKnByaXY7Cj4+Pj4gKwo+Pj4+ICsgICAgY29uc3Qgc3RydWN0IGRtYV9idWZfYXR0YWNo
X29wcyAqaW1wb3J0ZXJfb3BzOwo+Pj4+ICsgICAgdm9pZCAqaW1wb3J0ZXJfcHJpdjsKPj4+PiAg
ICB9Owo+Pj4+Cj4+Pj4gICAgLyoqCj4+Pj4gQEAgLTQwNSwxMCArNDY0LDQyIEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBnZXRfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQo+Pj4+ICAgICAg
IGdldF9maWxlKGRtYWJ1Zi0+ZmlsZSk7Cj4+Pj4gICAgfQo+Pj4+Cj4+Pj4gKy8qKgo+Pj4+ICsg
KiBkbWFfYnVmX2lzX2R5bmFtaWMgLSBjaGVjayBpZiBhIERNQS1idWYgdXNlcyBkeW5hbWljIG1h
cHBpbmdzLgo+Pj4+ICsgKiBAZG1hYnVmOiB0aGUgRE1BLWJ1ZiB0byBjaGVjawo+Pj4+ICsgKgo+
Pj4+ICsgKiBSZXR1cm5zIHRydWUgaWYgYSBETUEtYnVmIGV4cG9ydGVyIHdhbnRzIHRvIGNyZWF0
ZSBkeW5hbWljIHNnIHRhYmxlIG1hcHBpbmdzCj4+Pj4gKyAqIGZvciBlYWNoIGF0dGFjaG1lbnQu
IEZhbHNlIGlmIG9ubHkgYSBzaW5nbGUgc3RhdGljIHNnIHRhYmxlIHNob3VsZCBiZSB1c2VkLgo+
Pj4+ICsgKi8KPj4+PiArc3RhdGljIGlubGluZSBib29sIGRtYV9idWZfaXNfZHluYW1pYyhzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmKQo+Pj4+ICt7Cj4+Pj4gKyAgICByZXR1cm4gISFkbWFidWYtPm9w
cy0+cGluOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICsvKioKPj4+PiArICogZG1hX2J1Zl9hdHRhY2ht
ZW50X2lzX2R5bmFtaWMgLSBjaGVjayBpZiBhIERNQS1idWYgYXR0YWNobWVudCB1c2VzIGR5bmFt
aWMKPj4+PiArICogbWFwcGluc2cKPj4+PiArICogQGF0dGFjaDogdGhlIERNQS1idWYgYXR0YWNo
bWVudCB0byBjaGVjawo+Pj4+ICsgKgo+Pj4+ICsgKiBSZXR1cm5zIHRydWUgaWYgYSBETUEtYnVm
IGltcG9ydGVyIHdhbnRzIHRvIHVzZSBkeW5hbWljIHNnIHRhYmxlIG1hcHBpbmdzIGFuZAo+Pj4+
ICsgKiBjYWxscyB0aGUgbWFwL3VubWFwIGZ1bmN0aW9ucyB3aXRoIHRoZSByZXNlcnZhdGlvbiBv
YmplY3QgbG9ja2VkLgo+Pj4+ICsgKi8KPj4+PiArc3RhdGljIGlubGluZSBib29sCj4+Pj4gK2Rt
YV9idWZfYXR0YWNobWVudF9pc19keW5hbWljKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0
dGFjaCkKPj4+PiArewo+Pj4+ICsgICAgcmV0dXJuIGF0dGFjaC0+aW1wb3J0ZXJfb3BzICYmIGF0
dGFjaC0+aW1wb3J0ZXJfb3BzLT5tb3ZlX25vdGlmeTsKPj4+PiArfQo+Pj4+ICsKPj4+PiAgICBz
dHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICpkbWFfYnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAq
ZG1hYnVmLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2KTsKPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+Pj4+ICtzdHJ1Y3QgZG1hX2J1
Zl9hdHRhY2htZW50ICoKPj4+PiArZG1hX2J1Zl9keW5hbWljX2F0dGFjaChzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2hfb3BzICppbXBvcnRlcl9vcHMsCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICB2b2lkICppbXBvcnRlcl9wcml2KTsKPj4+PiAgICB2b2lkIGRtYV9idWZf
ZGV0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICpkbWFidWZfYXR0YWNoKTsKPj4+PiAr
ICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCk7Cj4+Pj4g
K2ludCBkbWFfYnVmX3BpbihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpOwo+Pj4+
ICt2b2lkIGRtYV9idWZfdW5waW4oc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKTsK
Pj4+Pgo+Pj4+ICAgIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmX2V4cG9ydChjb25zdCBzdHJ1Y3Qg
ZG1hX2J1Zl9leHBvcnRfaW5mbyAqZXhwX2luZm8pOwo+Pj4+Cj4+Pj4gQEAgLTQyMCw2ICs1MTEs
NyBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRtYV9idWZfbWFwX2F0dGFjaG1lbnQoc3RydWN0IGRtYV9i
dWZfYXR0YWNobWVudCAqLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24pOwo+Pj4+ICAgIHZvaWQgZG1hX2J1Zl91bm1hcF9h
dHRhY2htZW50KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKiwgc3RydWN0IHNnX3RhYmxlICos
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rp
b24pOwo+Pj4+ICt2b2lkIGRtYV9idWZfbW92ZV9ub3RpZnkoc3RydWN0IGRtYV9idWYgKmRtYV9i
dWYpOwo+Pj4+ICAgIGludCBkbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3Moc3RydWN0IGRtYV9idWYg
KmRtYV9idWYsCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBkbWFfZGF0YV9k
aXJlY3Rpb24gZGlyKTsKPj4+PiAgICBpbnQgZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcyhzdHJ1Y3Qg
ZG1hX2J1ZiAqZG1hX2J1ZiwKPj4+PiAtLQo+Pj4+IDIuMTcuMQo+Pj4+Cj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBJbnRlbC1nZnggbWFp
bGluZyBsaXN0Cj4+Pj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
