Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5641D1EAE8
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 11:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055008973E;
	Wed, 15 May 2019 09:27:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084718972D;
 Wed, 15 May 2019 09:27:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s17so1842722wru.3;
 Wed, 15 May 2019 02:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nAt/ZIjJDHeSlwRUMUuLSTMVhst3Z24+Mu7nPrqd8/s=;
 b=kF+7RZyrVSXpZLOvp8YBZbffAnHiADkH1ifbNPbgRWqB61PyREzUYlYNWkaadGS6zb
 dHSRRJcDe+3UrCHR8lhxiRZ0X4xvDCRjz2jFzdjNvmzT6xGjtoLVwWdZTHKubQM6eq2e
 +tmGThyz1doRfYbXaayUlE+nokbEG96wY/IgsfzXSN6ffX9KU1gKzvZvCjhamMn8CekZ
 tST66SUp01tVTCFyLFaXaJkM8A9qBcjvF0yYERvvuNjv/UV2y/9zWkpvZNwIFCN0Mu/A
 NenowpIL28pctSw/RWefNZXAwdVq/47HzRA2cSfcZGS8v+NyjdQKd0sr2MdTDiTiJtgz
 uiug==
X-Gm-Message-State: APjAAAVQjbhO6wHYCg8vBWfERs6u7ysWiV6aoUKxHTyURbUKYcG3SG0u
 STjFrNvYjQliMNqyNrDl0h5tAT6y
X-Google-Smtp-Source: APXvYqwxX5BS9S5+PMIR38f0oWXUCHLiBdBBrBTMMvpQrfwet9XLh7leGnyRkrqwy6p7yvD37uKAxQ==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr23956556wrn.77.1557912447460; 
 Wed, 15 May 2019 02:27:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f2sm1757426wme.12.2019.05.15.02.27.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 02:27:26 -0700 (PDT)
Subject: Re: [PATCH 02/11] drm/ttm: fix busy memory to fail other user v8
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-2-christian.koenig@amd.com>
 <20190515083828.GB17751@phenom.ffwll.local>
 <20190515084551.GD17751@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6f862969-3937-df25-949f-9740a90dd457@gmail.com>
Date: Wed, 15 May 2019 11:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515084551.GD17751@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nAt/ZIjJDHeSlwRUMUuLSTMVhst3Z24+Mu7nPrqd8/s=;
 b=GAJmiSP7ZRFHpSkm1oy3cXaQdCe705rmmPLMvCJ7pxR8N1CN2ibdD7R/WMvA1rizJf
 iwUeRNl45wZumlUrK4NylDI7PBDSlf101wbB78FQAmsXCZ86bcjH4GNEsIPLoVTOVSS2
 EhiF2EraUBNEAtqRETLmxOSBh8L0T8uzVHWlxBitxr7ImUZr13ryqTUdsYsoRzTsGFCz
 mIxM05FSv/s2rbmqgi4DDgtl4+opRS0ag4xqbGPK94en7r2/yM+JVt/rCtkbr1vh0gPC
 tEi9f7sAwW+ND2hmLQ5qLMfRtFgaPEvoCCoMLJWD9C8VBo3xR3r00X7jTeaQzuenpIoC
 Eraw==
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
Cc: David1.Zhou@amd.com, Marek.Olsak@amd.com, amd-gfx@lists.freedesktop.org,
 Prike.Liang@amd.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTUuMDUuMTkgdW0gMTA6NDUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgTWF5
IDE1LCAyMDE5IGF0IDEwOjM4OjI4QU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9u
IFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDAyOjMxOjE4UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4+PiBGcm9tOiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgo+Pj4K
Pj4+IGhlYXZ5IGdwdSBqb2IgY291bGQgb2NjdXB5IG1lbW9yeSBsb25nIHRpbWUsIHdoaWNoIGxl
YWQgb3RoZXIgdXNlciBmYWlsIHRvIGdldCBtZW1vcnkuCj4+Pgo+Pj4gYmFzaWNhbGx5IHBpY2sg
dXAgQ2hyaXN0aWFuIGlkZWE6Cj4+Pgo+Pj4gMS4gUmVzZXJ2ZSB0aGUgQk8gaW4gREMgdXNpbmcg
YSB3d19tdXRleCB0aWNrZXQgKHRyaXZpYWwpLgo+Pj4gMi4gSWYgd2UgdGhlbiBydW4gaW50byB0
aGlzIEVCVVNZIGNvbmRpdGlvbiBpbiBUVE0gY2hlY2sgaWYgdGhlIEJPIHdlIG5lZWQgbWVtb3J5
IGZvciAob3IgcmF0aGVyIHRoZSB3d19tdXRleCBvZiBpdHMgcmVzZXJ2YXRpb24gb2JqZWN0KSBo
YXMgYSB0aWNrZXQgYXNzaWduZWQuCj4+PiAzLiBJZiB3ZSBoYXZlIGEgdGlja2V0IHdlIGdyYWIg
YSByZWZlcmVuY2UgdG8gdGhlIGZpcnN0IEJPIG9uIHRoZSBMUlUsIGRyb3AgdGhlIExSVSBsb2Nr
IGFuZCB0cnkgdG8gZ3JhYiB0aGUgcmVzZXJ2YXRpb24gbG9jayB3aXRoIHRoZSB0aWNrZXQuCj4+
PiA0LiBJZiBnZXR0aW5nIHRoZSByZXNlcnZhdGlvbiBsb2NrIHdpdGggdGhlIHRpY2tldCBzdWNj
ZWVkZWQgd2UgY2hlY2sgaWYgdGhlIEJPIGlzIHN0aWxsIHRoZSBmaXJzdCBvbmUgb24gdGhlIExS
VSBpbiBxdWVzdGlvbiAodGhlIEJPIGNvdWxkIGhhdmUgbW92ZWQpLgo+Pj4gNS4gSWYgdGhlIEJP
IGlzIHN0aWxsIHRoZSBmaXJzdCBvbmUgb24gdGhlIExSVSBpbiBxdWVzdGlvbiB3ZSB0cnkgdG8g
ZXZpY3QgaXQgYXMgd2Ugd291bGQgZXZpY3QgYW55IG90aGVyIEJPLgo+Pj4gNi4gSWYgYW55IG9m
IHRoZSAiSWYncyIgYWJvdmUgZmFpbCB3ZSBqdXN0IGJhY2sgb2ZmIGFuZCByZXR1cm4gLUVCVVNZ
Lgo+Pj4KPj4+IHYyOiBmaXggc29tZSBtaW5vciBjaGVjawo+Pj4gdjM6IGFkZHJlc3MgQ2hyaXN0
aWFuIHYyIGNvbW1lbnRzLgo+Pj4gdjQ6IGZpeCBzb21lIG1pc3NpbmcKPj4+IHY1OiBoYW5kbGUg
Zmlyc3RfYm8gdW5sb2NrIGFuZCBib19nZXQvcHV0Cj4+PiB2NjogYWJzdHJhY3QgdW5pZmllZCBp
dGVyYXRlIGZ1bmN0aW9uLCBhbmQgaGFuZGxlIGFsbCBwb3NzaWJsZSB1c2VjYXNlIG5vdCBvbmx5
IHBpbm5lZCBiby4KPj4+IHY3OiBwYXNzIHJlcXVlc3QgYm8tPnJlc3YgdG8gdHRtX2JvX2V2aWN0
X2ZpcnN0Cj4+PiB2OCAoY2hrKTogbWluaW1hbCBjb2Rpbmcgc3R5bGUgZml4Cj4+Pgo+Pj4gQ2hh
bmdlLUlkOiBJMjE0MjNmYjkyMmY4ODU0NjVmMTM4MzNjNDFkZjFlMTM0MzY0YThlNwo+Pj4gU2ln
bmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KPj4+IFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IEkg
dGhpbmsgdGhpcyBjbG9zZXMgYSBiaWcgZ2FwIGJldHdlZW4gdHRtIGFuZCB0aGUgYmtsL3N0cnVj
dF9tdXRleAo+PiBkcml2ZXJzIC0gaXQncyBtdWNoIGVhc2llciB0byBndWFyYW50ZWUgeW91IGNh
biBldmljdCBldmVyeXRoaW5nIGlmCj4+IHRoZXJlJ3Mgb25seSBhIHNpbmdsZSBsb2NrIDotKQo+
Pgo+PiBXb3VsZCBiZSBhYnNvbHV0ZWx5IGF3ZXNvbWUgaWYgd2UgY291bGQgZXh0cmFjdCB0aGlz
IGFzIHNvbWUga2luZCBvZgo+PiBidWlsZGluZyBibG9jaywgbGlrZSB3ZSd2ZSBkb25lIHdpdGgg
bG90cyBvZiBvdGhlciB0dG0gY29uY2VwdHMgYWxyZWFkeQo+PiAocmVzZXJ2YXRpb25fb2JqLCBm
ZW5jZXMsIC4uLikuCj4+Cj4+IEp1c3QgYW4gYXNpZGUgcmVhbGx5Lgo+IE9mYyB0aGlzIGlzIG1l
YW50IGFzIGEgY29tbWVudCBvbiB0aGUgZW50aXJlIHBhdGNoIHNlcmllcywgd2l0aG91dCBhbGwg
dGhlCj4gb3RoZXIgcGF0Y2hlcyB0byBtYWtlIHN1cmUgQk8gYWx3YXlzIHN0YXkgb24gYSByZWxl
dmFudCBMUlUgdGhlcmUncyBzdGlsbAo+IGdhcHMgaW4gdGhlIGd1YXJhbnRlZWQgZm9yd2FyZCBw
cm9ncmVzcyBldmljdGlvbiBhbGdvcml0aG0uCgpZZWFoLCB0aGUgcHJvYmxlbSBzdXJmYWNlZCBi
ZWNhdXNlIG9mIHBhdGNoICM0LiBQcmV2aW91c2x5IFRUTSB3b3VsZCAKaGF2ZSBqdXN0IGlnbm9y
ZWQgYWxsIGVycm9ycyBhbmQgY29udGludWVkIHRvIHRyeSBkaWZmZXJlbnQgcGxhY2VtZW50cyAK
YW5kIG9ubHkgcmV0dXJuIC1FTk9NRU0gd2hlbiB3ZSByYW4gb3V0IG9mIGEgcG9zc2libGUgcGxh
Y2VtZW50cy4KCkkgcHJvYmFibHkgbmVlZCB0byBlaXRoZXIgZml4IHBhdGNoICM0IG9yIHJlb3Jk
ZXIgdGhlIHBhdGNoZXMuCgpUaGFua3MgZm9yIHRoZSBub3RlLApDaHJpc3RpYW4uCgo+IC1EYW5p
ZWwKPgo+PiAtRGFuaWVsCj4+Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyB8IDExMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCj4+PiBpbmRleCAyODQ1ZmNlYjJmYmQuLmU2MzRkM2EzNjkyMyAxMDA2NDQK
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPj4+IEBAIC03NjYsMTEgKzc2NiwxMyBAQCBFWFBPUlRfU1lN
Qk9MKHR0bV9ib19ldmljdGlvbl92YWx1YWJsZSk7Cj4+PiAgICAqIGIuIE90aGVyd2lzZSwgdHJ5
bG9jayBpdC4KPj4+ICAgICovCj4+PiAgIHN0YXRpYyBib29sIHR0bV9ib19ldmljdF9zd2Fwb3V0
X2FsbG93YWJsZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+Pj4gLQkJCXN0cnVjdCB0
dG1fb3BlcmF0aW9uX2N0eCAqY3R4LCBib29sICpsb2NrZWQpCj4+PiArCQkJc3RydWN0IHR0bV9v
cGVyYXRpb25fY3R4ICpjdHgsIGJvb2wgKmxvY2tlZCwgYm9vbCAqYnVzeSkKPj4+ICAgewo+Pj4g
ICAJYm9vbCByZXQgPSBmYWxzZTsKPj4+ICAgCj4+PiAgIAkqbG9ja2VkID0gZmFsc2U7Cj4+PiAr
CWlmIChidXN5KQo+Pj4gKwkJKmJ1c3kgPSBmYWxzZTsKPj4+ICAgCWlmIChiby0+cmVzdiA9PSBj
dHgtPnJlc3YpIHsKPj4+ICAgCQlyZXNlcnZhdGlvbl9vYmplY3RfYXNzZXJ0X2hlbGQoYm8tPnJl
c3YpOwo+Pj4gICAJCWlmIChjdHgtPmZsYWdzICYgVFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklD
VAo+Pj4gQEAgLTc3OSwzNSArNzgxLDQ2IEBAIHN0YXRpYyBib29sIHR0bV9ib19ldmljdF9zd2Fw
b3V0X2FsbG93YWJsZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+Pj4gICAJfSBlbHNl
IHsKPj4+ICAgCQkqbG9ja2VkID0gcmVzZXJ2YXRpb25fb2JqZWN0X3RyeWxvY2soYm8tPnJlc3Yp
Owo+Pj4gICAJCXJldCA9ICpsb2NrZWQ7Cj4+PiArCQlpZiAoIXJldCAmJiBidXN5KQo+Pj4gKwkJ
CSpidXN5ID0gdHJ1ZTsKPj4+ICAgCX0KPj4+ICAgCj4+PiAgIAlyZXR1cm4gcmV0Owo+Pj4gICB9
Cj4+PiAgIAo+Pj4gLXN0YXRpYyBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwKPj4+IC0JCQkgICAgICAgdWludDMyX3QgbWVtX3R5cGUsCj4+PiAtCQkJ
ICAgICAgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+Pj4gLQkJCSAgICAgICBzdHJ1
Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCkKPj4+ICtzdGF0aWMgc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0Kgo+Pj4gK3R0bV9tZW1fZmluZF9ldml0YWJsZV9ibyhzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwKPj4+ICsJCQkgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4+PiAr
CQkJIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+Pj4gKwkJCSBzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggKmN0eCwKPj4+ICsJCQkgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICoqZmly
c3RfYm8sCj4+PiArCQkJIGJvb2wgKmxvY2tlZCkKPj4+ICAgewo+Pj4gLQlzdHJ1Y3QgdHRtX2Jv
X2dsb2JhbCAqZ2xvYiA9IGJkZXYtPmdsb2I7Cj4+PiAtCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFu
YWdlciAqbWFuID0gJmJkZXYtPm1hblttZW1fdHlwZV07Cj4+PiAgIAlzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvID0gTlVMTDsKPj4+IC0JYm9vbCBsb2NrZWQgPSBmYWxzZTsKPj4+IC0JdW5z
aWduZWQgaTsKPj4+IC0JaW50IHJldDsKPj4+ICsJaW50IGk7Cj4+PiAgIAo+Pj4gLQlzcGluX2xv
Y2soJmdsb2ItPmxydV9sb2NrKTsKPj4+ICsJaWYgKGZpcnN0X2JvKQo+Pj4gKwkJKmZpcnN0X2Jv
ID0gTlVMTDsKPj4+ICAgCWZvciAoaSA9IDA7IGkgPCBUVE1fTUFYX0JPX1BSSU9SSVRZOyArK2kp
IHsKPj4+ICAgCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJvLCAmbWFuLT5scnVbaV0sIGxydSkgewo+
Pj4gLQkJCWlmICghdHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKGJvLCBjdHgsICZsb2Nr
ZWQpKQo+Pj4gKwkJCWJvb2wgYnVzeSA9IGZhbHNlOwo+Pj4gKwo+Pj4gKwkJCWlmICghdHRtX2Jv
X2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKGJvLCBjdHgsIGxvY2tlZCwKPj4+ICsJCQkJCQkJICAg
ICZidXN5KSkgewo+Pj4gKwkJCQlpZiAoZmlyc3RfYm8gJiYgISgqZmlyc3RfYm8pICYmIGJ1c3kp
IHsKPj4+ICsJCQkJCXR0bV9ib19nZXQoYm8pOwo+Pj4gKwkJCQkJKmZpcnN0X2JvID0gYm87Cj4+
PiArCQkJCX0KPj4+ICAgCQkJCWNvbnRpbnVlOwo+Pj4gKwkJCX0KPj4+ICAgCj4+PiAgIAkJCWlm
IChwbGFjZSAmJiAhYmRldi0+ZHJpdmVyLT5ldmljdGlvbl92YWx1YWJsZShibywKPj4+ICAgCQkJ
CQkJCQkgICAgICBwbGFjZSkpIHsKPj4+IC0JCQkJaWYgKGxvY2tlZCkKPj4+ICsJCQkJaWYgKCps
b2NrZWQpCj4+PiAgIAkJCQkJcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhiby0+cmVzdik7Cj4+
PiAgIAkJCQljb250aW51ZTsKPj4+ICAgCQkJfQo+Pj4gKwo+Pj4gICAJCQlicmVhazsKPj4+ICAg
CQl9Cj4+PiAgIAo+Pj4gQEAgLTgxOCw5ICs4MzEsNjkgQEAgc3RhdGljIGludCB0dG1fbWVtX2V2
aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+Pj4gICAJCWJvID0gTlVMTDsK
Pj4+ICAgCX0KPj4+ICAgCj4+PiArCXJldHVybiBibzsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGlj
IGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+Pj4g
KwkJCSAgICAgICB1aW50MzJfdCBtZW1fdHlwZSwKPj4+ICsJCQkgICAgICAgY29uc3Qgc3RydWN0
IHR0bV9wbGFjZSAqcGxhY2UsCj4+PiArCQkJICAgICAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0
eCAqY3R4LAo+Pj4gKwkJCSAgICAgICBzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyZXF1ZXN0
X3Jlc3YpCj4+PiArewo+Pj4gKwlzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9IGJkZXYtPmds
b2I7Cj4+PiArCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1hbltt
ZW1fdHlwZV07Cj4+PiArCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBOVUxMLCAqZmly
c3RfYm8gPSBOVUxMOwo+Pj4gKwlib29sIGxvY2tlZCA9IGZhbHNlOwo+Pj4gKwlpbnQgcmV0Owo+
Pj4gKwo+Pj4gKwlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4+ICsJYm8gPSB0dG1fbWVt
X2ZpbmRfZXZpdGFibGVfYm8oYmRldiwgbWFuLCBwbGFjZSwgY3R4LCAmZmlyc3RfYm8sCj4+PiAr
CQkJCSAgICAgICZsb2NrZWQpOwo+Pj4gICAJaWYgKCFibykgewo+Pj4gKwkJc3RydWN0IHd3X2Fj
cXVpcmVfY3R4ICphY3F1aXJlX2N0eCA9IHJlcXVlc3RfcmVzdi0+bG9jay5jdHg7Cj4+PiArCQlz
dHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggYnVzeV9jdHg7Cj4+PiArCj4+PiAgIAkJc3Bpbl91bmxv
Y2soJmdsb2ItPmxydV9sb2NrKTsKPj4+IC0JCXJldHVybiAtRUJVU1k7Cj4+PiArCQkvKiBjaGVj
ayBpZiBvdGhlciB1c2VyIG9jY3VweSBtZW1vcnkgdG9vIGxvbmcgdGltZSAqLwo+Pj4gKwkJaWYg
KCFmaXJzdF9ibyB8fCAhcmVxdWVzdF9yZXN2IHx8ICFyZXF1ZXN0X3Jlc3YtPmxvY2suY3R4KSB7
Cj4+PiArCQkJaWYgKGZpcnN0X2JvKQo+Pj4gKwkJCQl0dG1fYm9fcHV0KGZpcnN0X2JvKTsKPj4+
ICsJCQlyZXR1cm4gLUVCVVNZOwo+Pj4gKwkJfQo+Pj4gKwkJaWYgKGZpcnN0X2JvLT5yZXN2ID09
IHJlcXVlc3RfcmVzdikgewo+Pj4gKwkJCXR0bV9ib19wdXQoZmlyc3RfYm8pOwo+Pj4gKwkJCXJl
dHVybiAtRUJVU1k7Cj4+PiArCQl9Cj4+PiArCQlpZiAoY3R4LT5pbnRlcnJ1cHRpYmxlKQo+Pj4g
KwkJCXJldCA9IHd3X211dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmZmlyc3RfYm8tPnJlc3YtPmxv
Y2ssCj4+PiArCQkJCQkJCSAgYWNxdWlyZV9jdHgpOwo+Pj4gKwkJZWxzZQo+Pj4gKwkJCXJldCA9
IHd3X211dGV4X2xvY2soJmZpcnN0X2JvLT5yZXN2LT5sb2NrLAo+Pj4gKwkJCQkJICAgIGFjcXVp
cmVfY3R4KTsKPj4+ICsJCWlmIChyZXQpIHsKPj4+ICsJCQl0dG1fYm9fcHV0KGZpcnN0X2JvKTsK
Pj4+ICsJCQlyZXR1cm4gcmV0Owo+Pj4gKwkJfQo+Pj4gKwkJc3Bpbl9sb2NrKCZnbG9iLT5scnVf
bG9jayk7Cj4+PiArCQkvKiBwcmV2aW91cyBidXN5IHJlc3YgbG9jayBpcyBoZWxkIGJ5IGFib3Zl
LCBpZGxlIG5vdywKPj4+ICsJCSAqIHNvIGxldCB0aGVtIGV2aWN0YWJsZS4KPj4+ICsJCSAqLwo+
Pj4gKwkJYnVzeV9jdHguaW50ZXJydXB0aWJsZSA9IGN0eC0+aW50ZXJydXB0aWJsZTsKPj4+ICsJ
CWJ1c3lfY3R4Lm5vX3dhaXRfZ3B1ICAgPSBjdHgtPm5vX3dhaXRfZ3B1Owo+Pj4gKwkJYnVzeV9j
dHgucmVzdgkgICAgICAgPSBmaXJzdF9iby0+cmVzdjsKPj4+ICsJCWJ1c3lfY3R4LmZsYWdzCSAg
ICAgICA9IFRUTV9PUFRfRkxBR19BTExPV19SRVNfRVZJQ1Q7Cj4+PiArCj4+PiArCQlibyA9IHR0
bV9tZW1fZmluZF9ldml0YWJsZV9ibyhiZGV2LCBtYW4sIHBsYWNlLCAmYnVzeV9jdHgsIE5VTEws
Cj4+PiArCQkJCQkgICAgICAmbG9ja2VkKTsKPj4+ICsJCWlmIChibyAmJiAoYm8tPnJlc3YgPT0g
Zmlyc3RfYm8tPnJlc3YpKQo+Pj4gKwkJCWxvY2tlZCA9IHRydWU7Cj4+PiArCQllbHNlIGlmIChi
bykKPj4+ICsJCQl3d19tdXRleF91bmxvY2soJmZpcnN0X2JvLT5yZXN2LT5sb2NrKTsKPj4+ICsJ
CWlmICghYm8pIHsKPj4+ICsJCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+Pj4gKwkJ
CXR0bV9ib19wdXQoZmlyc3RfYm8pOwo+Pj4gKwkJCXJldHVybiAtRUJVU1k7Cj4+PiArCQl9Cj4+
PiAgIAl9Cj4+PiAgIAo+Pj4gICAJa3JlZl9nZXQoJmJvLT5saXN0X2tyZWYpOwo+Pj4gQEAgLTgy
OSwxMSArOTAyLDE1IEBAIHN0YXRpYyBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldiwKPj4+ICAgCQlyZXQgPSB0dG1fYm9fY2xlYW51cF9yZWZzKGJvLCBj
dHgtPmludGVycnVwdGlibGUsCj4+PiAgIAkJCQkJICBjdHgtPm5vX3dhaXRfZ3B1LCBsb2NrZWQp
Owo+Pj4gICAJCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsK
Pj4+ICsJCWlmIChmaXJzdF9ibykKPj4+ICsJCQl0dG1fYm9fcHV0KGZpcnN0X2JvKTsKPj4+ICAg
CQlyZXR1cm4gcmV0Owo+Pj4gICAJfQo+Pj4gICAKPj4+ICAgCXR0bV9ib19kZWxfZnJvbV9scnUo
Ym8pOwo+Pj4gICAJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4+ICsJaWYgKGZpcnN0
X2JvKQo+Pj4gKwkJdHRtX2JvX3B1dChmaXJzdF9ibyk7Cj4+PiAgIAo+Pj4gICAJcmV0ID0gdHRt
X2JvX2V2aWN0KGJvLCBjdHgpOwo+Pj4gICAJaWYgKGxvY2tlZCkgewo+Pj4gQEAgLTkwNyw3ICs5
ODQsNyBAQCBzdGF0aWMgaW50IHR0bV9ib19tZW1fZm9yY2Vfc3BhY2Uoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKPj4+ICAgCQkJcmV0dXJuIHJldDsKPj4+ICAgCQlpZiAobWVtLT5tbV9u
b2RlKQo+Pj4gICAJCQlicmVhazsKPj4+IC0JCXJldCA9IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRl
diwgbWVtX3R5cGUsIHBsYWNlLCBjdHgpOwo+Pj4gKwkJcmV0ID0gdHRtX21lbV9ldmljdF9maXJz
dChiZGV2LCBtZW1fdHlwZSwgcGxhY2UsIGN0eCwgYm8tPnJlc3YpOwo+Pj4gICAJCWlmICh1bmxp
a2VseShyZXQgIT0gMCkpCj4+PiAgIAkJCXJldHVybiByZXQ7Cj4+PiAgIAl9IHdoaWxlICgxKTsK
Pj4+IEBAIC0xNDAxLDcgKzE0NzgsOCBAQCBzdGF0aWMgaW50IHR0bV9ib19mb3JjZV9saXN0X2Ns
ZWFuKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+Pj4gICAJZm9yIChpID0gMDsgaSA8IFRU
TV9NQVhfQk9fUFJJT1JJVFk7ICsraSkgewo+Pj4gICAJCXdoaWxlICghbGlzdF9lbXB0eSgmbWFu
LT5scnVbaV0pKSB7Cj4+PiAgIAkJCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+PiAt
CQkJcmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW1fdHlwZSwgTlVMTCwgJmN0eCk7
Cj4+PiArCQkJcmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW1fdHlwZSwgTlVMTCwg
JmN0eCwKPj4+ICsJCQkJCQkgIE5VTEwpOwo+Pj4gICAJCQlpZiAocmV0KQo+Pj4gICAJCQkJcmV0
dXJuIHJldDsKPj4+ICAgCQkJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+PiBAQCAtMTc3
Miw3ICsxODUwLDggQEAgaW50IHR0bV9ib19zd2Fwb3V0KHN0cnVjdCB0dG1fYm9fZ2xvYmFsICpn
bG9iLCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCkKPj4+ICAgCXNwaW5fbG9jaygmZ2xv
Yi0+bHJ1X2xvY2spOwo+Pj4gICAJZm9yIChpID0gMDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7
ICsraSkgewo+Pj4gICAJCWxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZnbG9iLT5zd2FwX2xydVtp
XSwgc3dhcCkgewo+Pj4gLQkJCWlmICh0dG1fYm9fZXZpY3Rfc3dhcG91dF9hbGxvd2FibGUoYm8s
IGN0eCwgJmxvY2tlZCkpIHsKPj4+ICsJCQlpZiAodHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dh
YmxlKGJvLCBjdHgsICZsb2NrZWQsCj4+PiArCQkJCQkJCSAgIE5VTEwpKSB7Cj4+PiAgIAkJCQly
ZXQgPSAwOwo+Pj4gICAJCQkJYnJlYWs7Cj4+PiAgIAkJCX0KPj4+IC0tIAo+Pj4gMi4xNy4xCj4+
Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCj4+IC0tIAo+PiBEYW5pZWwgVmV0dGVyCj4+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgo+PiBodHRwOi8vYmxvZy5mZndsbC5jaAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
