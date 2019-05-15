Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A31EAED
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 11:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE96689745;
	Wed, 15 May 2019 09:30:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82E089745;
 Wed, 15 May 2019 09:30:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r4so1824618wro.10;
 Wed, 15 May 2019 02:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=CCvySbeLvXmq+njsaLIRvmezolppJ+IaujhQSQreExM=;
 b=cigNwoODcyZMp5h/tyFdyA8PUw/yPExcs0JK1JG1HOFerXKCYjgwL3dqIOiEeDmBFc
 Z7et4cV5IpcEHTCg+Y6Mh08EkXfw0NbX79cDyzlymqs2ZoD/G2gWbfuygNav/ucGXXMY
 +7aq87b845xOCfa+IVRU5Oh12ateAfOZMfJJ9V1uprigON0AbSyD0h2uwP0VTpCVusAi
 26/HT5C3Sq7bwto6U6GiL0+rrk+dD2MWMs2y038y4+vJim344S/uhI90lYowyPnVuVEV
 uf85ckXLITJORfBOo3zAztyUtxtQ/T2usthgpLI9mOP1dacSU6TnHlnmLGKCziaAgRmD
 R3FQ==
X-Gm-Message-State: APjAAAXrf2SRPYulPJfPt3Y+mlyJ8rplndHxSAnQPz2khhbieWYjt4Vt
 uxwQ0h3qFUI6Rw/z+PWvtS+qGOOE
X-Google-Smtp-Source: APXvYqz4fF15Q+c8G0O6fLTFNjbFTCi3CsTIm0xDlWXI6K3Ts+GrP3xRg+LniSjht8NAT/o2CBlhLA==
X-Received: by 2002:adf:edce:: with SMTP id v14mr21801122wro.94.1557912622629; 
 Wed, 15 May 2019 02:30:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t6sm1719749wmt.8.2019.05.15.02.30.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 02:30:22 -0700 (PDT)
Subject: Re: [PATCH 02/11] drm/ttm: fix busy memory to fail other user v8
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-2-christian.koenig@amd.com>
 <20190515083828.GB17751@phenom.ffwll.local>
 <20190515084551.GD17751@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <43e02be3-cdcf-085b-9c81-038c580a1aac@gmail.com>
Date: Wed, 15 May 2019 11:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515084551.GD17751@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CCvySbeLvXmq+njsaLIRvmezolppJ+IaujhQSQreExM=;
 b=LAlnmrMHQK1hkXA+YzS+95I7toeQtPzhCt4UECxUeVu3KnuSf8dPzrJnWqjV6ksVLR
 L8zwnVOMG5mSD1HgJjVTe/6cSQEAUM2tR664N3xdA8CbNUWAYTj3Ez6oO534+cxxhuTn
 0RkEtYv9PXnZns9rkPY3aCqDwAiKDzt8cSAROEMCvlX9x/tu6bylFXEp15y6Y75wTfCn
 4ax2pXkdY/n5jnI98dJonyNGt60bYzt+GtnO0x1xffOFLU7PtjuJSpOESgILoKj3yMaO
 pvUUKM/UOMAlgUBD/c/MSANojRWEmwiNPwa2SR9VWufSttJBOl11zpdXemisRWcr3Lwo
 +NqQ==
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
cm9ncmVzcyBldmljdGlvbiBhbGdvcml0aG0uCgpZZWFoLCBhbmQgZXNwZWNpYWxseSB0aGF0IE1h
cmVrIHJhbiBpbnRvIGEgYmFkIGluIGtlcm5lbCBkZWFkbG9jayBpcyBhIApzZXJpb3VzIG5vLWdv
IGZvciB0aGUgbW9tZW50LgoKTmVlZCB0byBmaWd1cmUgb3V0IHdoYXQgZXhhY3RseSBpcyBnb2lu
ZyB3cm9uZyBoZXJlIGZpcnN0LCBidXQgaW4gCmdlbmVyYWwgSSBjb21wbGV0ZWx5IGFncmVlIHRo
YXQgd2Ugc2hvdWxkIG1vdmUgdGhpcyBsb2dpYyBvdXQgb2YgVFRNLgoKQ2hyaXN0aWFuLgoKPiAt
RGFuaWVsCj4KPj4gLURhbmllbAo+Pgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgfCAxMTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwo+Pj4gaW5kZXggMjg0NWZjZWIyZmJkLi5lNjM0ZDNhMzY5MjMgMTAw
NjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiBAQCAtNzY2LDExICs3NjYsMTMgQEAgRVhQT1JU
X1NZTUJPTCh0dG1fYm9fZXZpY3Rpb25fdmFsdWFibGUpOwo+Pj4gICAgKiBiLiBPdGhlcndpc2Us
IHRyeWxvY2sgaXQuCj4+PiAgICAqLwo+Pj4gICBzdGF0aWMgYm9vbCB0dG1fYm9fZXZpY3Rfc3dh
cG91dF9hbGxvd2FibGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+IC0JCQlzdHJ1
Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwgYm9vbCAqbG9ja2VkKQo+Pj4gKwkJCXN0cnVjdCB0
dG1fb3BlcmF0aW9uX2N0eCAqY3R4LCBib29sICpsb2NrZWQsIGJvb2wgKmJ1c3kpCj4+PiAgIHsK
Pj4+ICAgCWJvb2wgcmV0ID0gZmFsc2U7Cj4+PiAgIAo+Pj4gICAJKmxvY2tlZCA9IGZhbHNlOwo+
Pj4gKwlpZiAoYnVzeSkKPj4+ICsJCSpidXN5ID0gZmFsc2U7Cj4+PiAgIAlpZiAoYm8tPnJlc3Yg
PT0gY3R4LT5yZXN2KSB7Cj4+PiAgIAkJcmVzZXJ2YXRpb25fb2JqZWN0X2Fzc2VydF9oZWxkKGJv
LT5yZXN2KTsKPj4+ICAgCQlpZiAoY3R4LT5mbGFncyAmIFRUTV9PUFRfRkxBR19BTExPV19SRVNf
RVZJQ1QKPj4+IEBAIC03NzksMzUgKzc4MSw0NiBAQCBzdGF0aWMgYm9vbCB0dG1fYm9fZXZpY3Rf
c3dhcG91dF9hbGxvd2FibGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+ICAgCX0g
ZWxzZSB7Cj4+PiAgIAkJKmxvY2tlZCA9IHJlc2VydmF0aW9uX29iamVjdF90cnlsb2NrKGJvLT5y
ZXN2KTsKPj4+ICAgCQlyZXQgPSAqbG9ja2VkOwo+Pj4gKwkJaWYgKCFyZXQgJiYgYnVzeSkKPj4+
ICsJCQkqYnVzeSA9IHRydWU7Cj4+PiAgIAl9Cj4+PiAgIAo+Pj4gICAJcmV0dXJuIHJldDsKPj4+
ICAgfQo+Pj4gICAKPj4+IC1zdGF0aWMgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsCj4+PiAtCQkJICAgICAgIHVpbnQzMl90IG1lbV90eXBlLAo+Pj4g
LQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKPj4+IC0JCQkgICAgICAg
c3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCj4+PiArc3RhdGljIHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCoKPj4+ICt0dG1fbWVtX2ZpbmRfZXZpdGFibGVfYm8oc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsCj4+PiArCQkJIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+
Pj4gKwkJCSBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKPj4+ICsJCQkgc3RydWN0IHR0
bV9vcGVyYXRpb25fY3R4ICpjdHgsCj4+PiArCQkJIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
KmZpcnN0X2JvLAo+Pj4gKwkJCSBib29sICpsb2NrZWQpCj4+PiAgIHsKPj4+IC0Jc3RydWN0IHR0
bV9ib19nbG9iYWwgKmdsb2IgPSBiZGV2LT5nbG9iOwo+Pj4gLQlzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bbWVtX3R5cGVdOwo+Pj4gICAJc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibyA9IE5VTEw7Cj4+PiAtCWJvb2wgbG9ja2VkID0gZmFsc2U7Cj4+PiAt
CXVuc2lnbmVkIGk7Cj4+PiAtCWludCByZXQ7Cj4+PiArCWludCBpOwo+Pj4gICAKPj4+IC0Jc3Bp
bl9sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+PiArCWlmIChmaXJzdF9ibykKPj4+ICsJCSpmaXJz
dF9ibyA9IE5VTEw7Cj4+PiAgIAlmb3IgKGkgPSAwOyBpIDwgVFRNX01BWF9CT19QUklPUklUWTsg
KytpKSB7Cj4+PiAgIAkJbGlzdF9mb3JfZWFjaF9lbnRyeShibywgJm1hbi0+bHJ1W2ldLCBscnUp
IHsKPj4+IC0JCQlpZiAoIXR0bV9ib19ldmljdF9zd2Fwb3V0X2FsbG93YWJsZShibywgY3R4LCAm
bG9ja2VkKSkKPj4+ICsJCQlib29sIGJ1c3kgPSBmYWxzZTsKPj4+ICsKPj4+ICsJCQlpZiAoIXR0
bV9ib19ldmljdF9zd2Fwb3V0X2FsbG93YWJsZShibywgY3R4LCBsb2NrZWQsCj4+PiArCQkJCQkJ
CSAgICAmYnVzeSkpIHsKPj4+ICsJCQkJaWYgKGZpcnN0X2JvICYmICEoKmZpcnN0X2JvKSAmJiBi
dXN5KSB7Cj4+PiArCQkJCQl0dG1fYm9fZ2V0KGJvKTsKPj4+ICsJCQkJCSpmaXJzdF9ibyA9IGJv
Owo+Pj4gKwkJCQl9Cj4+PiAgIAkJCQljb250aW51ZTsKPj4+ICsJCQl9Cj4+PiAgIAo+Pj4gICAJ
CQlpZiAocGxhY2UgJiYgIWJkZXYtPmRyaXZlci0+ZXZpY3Rpb25fdmFsdWFibGUoYm8sCj4+PiAg
IAkJCQkJCQkJICAgICAgcGxhY2UpKSB7Cj4+PiAtCQkJCWlmIChsb2NrZWQpCj4+PiArCQkJCWlm
ICgqbG9ja2VkKQo+Pj4gICAJCQkJCXJlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3Yp
Owo+Pj4gICAJCQkJY29udGludWU7Cj4+PiAgIAkJCX0KPj4+ICsKPj4+ICAgCQkJYnJlYWs7Cj4+
PiAgIAkJfQo+Pj4gICAKPj4+IEBAIC04MTgsOSArODMxLDY5IEBAIHN0YXRpYyBpbnQgdHRtX21l
bV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPj4+ICAgCQlibyA9IE5V
TEw7Cj4+PiAgIAl9Cj4+PiAgIAo+Pj4gKwlyZXR1cm4gYm87Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0
YXRpYyBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwK
Pj4+ICsJCQkgICAgICAgdWludDMyX3QgbWVtX3R5cGUsCj4+PiArCQkJICAgICAgIGNvbnN0IHN0
cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+Pj4gKwkJCSAgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlv
bl9jdHggKmN0eCwKPj4+ICsJCQkgICAgICAgc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVx
dWVzdF9yZXN2KQo+Pj4gK3sKPj4+ICsJc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IgPSBiZGV2
LT5nbG9iOwo+Pj4gKwlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5t
YW5bbWVtX3R5cGVdOwo+Pj4gKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gTlVMTCwg
KmZpcnN0X2JvID0gTlVMTDsKPj4+ICsJYm9vbCBsb2NrZWQgPSBmYWxzZTsKPj4+ICsJaW50IHJl
dDsKPj4+ICsKPj4+ICsJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+PiArCWJvID0gdHRt
X21lbV9maW5kX2V2aXRhYmxlX2JvKGJkZXYsIG1hbiwgcGxhY2UsIGN0eCwgJmZpcnN0X2JvLAo+
Pj4gKwkJCQkgICAgICAmbG9ja2VkKTsKPj4+ICAgCWlmICghYm8pIHsKPj4+ICsJCXN0cnVjdCB3
d19hY3F1aXJlX2N0eCAqYWNxdWlyZV9jdHggPSByZXF1ZXN0X3Jlc3YtPmxvY2suY3R4Owo+Pj4g
KwkJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGJ1c3lfY3R4Owo+Pj4gKwo+Pj4gICAJCXNwaW5f
dW5sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+PiAtCQlyZXR1cm4gLUVCVVNZOwo+Pj4gKwkJLyog
Y2hlY2sgaWYgb3RoZXIgdXNlciBvY2N1cHkgbWVtb3J5IHRvbyBsb25nIHRpbWUgKi8KPj4+ICsJ
CWlmICghZmlyc3RfYm8gfHwgIXJlcXVlc3RfcmVzdiB8fCAhcmVxdWVzdF9yZXN2LT5sb2NrLmN0
eCkgewo+Pj4gKwkJCWlmIChmaXJzdF9ibykKPj4+ICsJCQkJdHRtX2JvX3B1dChmaXJzdF9ibyk7
Cj4+PiArCQkJcmV0dXJuIC1FQlVTWTsKPj4+ICsJCX0KPj4+ICsJCWlmIChmaXJzdF9iby0+cmVz
diA9PSByZXF1ZXN0X3Jlc3YpIHsKPj4+ICsJCQl0dG1fYm9fcHV0KGZpcnN0X2JvKTsKPj4+ICsJ
CQlyZXR1cm4gLUVCVVNZOwo+Pj4gKwkJfQo+Pj4gKwkJaWYgKGN0eC0+aW50ZXJydXB0aWJsZSkK
Pj4+ICsJCQlyZXQgPSB3d19tdXRleF9sb2NrX2ludGVycnVwdGlibGUoJmZpcnN0X2JvLT5yZXN2
LT5sb2NrLAo+Pj4gKwkJCQkJCQkgIGFjcXVpcmVfY3R4KTsKPj4+ICsJCWVsc2UKPj4+ICsJCQly
ZXQgPSB3d19tdXRleF9sb2NrKCZmaXJzdF9iby0+cmVzdi0+bG9jaywKPj4+ICsJCQkJCSAgICBh
Y3F1aXJlX2N0eCk7Cj4+PiArCQlpZiAocmV0KSB7Cj4+PiArCQkJdHRtX2JvX3B1dChmaXJzdF9i
byk7Cj4+PiArCQkJcmV0dXJuIHJldDsKPj4+ICsJCX0KPj4+ICsJCXNwaW5fbG9jaygmZ2xvYi0+
bHJ1X2xvY2spOwo+Pj4gKwkJLyogcHJldmlvdXMgYnVzeSByZXN2IGxvY2sgaXMgaGVsZCBieSBh
Ym92ZSwgaWRsZSBub3csCj4+PiArCQkgKiBzbyBsZXQgdGhlbSBldmljdGFibGUuCj4+PiArCQkg
Ki8KPj4+ICsJCWJ1c3lfY3R4LmludGVycnVwdGlibGUgPSBjdHgtPmludGVycnVwdGlibGU7Cj4+
PiArCQlidXN5X2N0eC5ub193YWl0X2dwdSAgID0gY3R4LT5ub193YWl0X2dwdTsKPj4+ICsJCWJ1
c3lfY3R4LnJlc3YJICAgICAgID0gZmlyc3RfYm8tPnJlc3Y7Cj4+PiArCQlidXN5X2N0eC5mbGFn
cwkgICAgICAgPSBUVE1fT1BUX0ZMQUdfQUxMT1dfUkVTX0VWSUNUOwo+Pj4gKwo+Pj4gKwkJYm8g
PSB0dG1fbWVtX2ZpbmRfZXZpdGFibGVfYm8oYmRldiwgbWFuLCBwbGFjZSwgJmJ1c3lfY3R4LCBO
VUxMLAo+Pj4gKwkJCQkJICAgICAgJmxvY2tlZCk7Cj4+PiArCQlpZiAoYm8gJiYgKGJvLT5yZXN2
ID09IGZpcnN0X2JvLT5yZXN2KSkKPj4+ICsJCQlsb2NrZWQgPSB0cnVlOwo+Pj4gKwkJZWxzZSBp
ZiAoYm8pCj4+PiArCQkJd3dfbXV0ZXhfdW5sb2NrKCZmaXJzdF9iby0+cmVzdi0+bG9jayk7Cj4+
PiArCQlpZiAoIWJvKSB7Cj4+PiArCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4+
ICsJCQl0dG1fYm9fcHV0KGZpcnN0X2JvKTsKPj4+ICsJCQlyZXR1cm4gLUVCVVNZOwo+Pj4gKwkJ
fQo+Pj4gICAJfQo+Pj4gICAKPj4+ICAgCWtyZWZfZ2V0KCZiby0+bGlzdF9rcmVmKTsKPj4+IEBA
IC04MjksMTEgKzkwMiwxNSBAQCBzdGF0aWMgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4+PiAgIAkJcmV0ID0gdHRtX2JvX2NsZWFudXBfcmVmcyhi
bywgY3R4LT5pbnRlcnJ1cHRpYmxlLAo+Pj4gICAJCQkJCSAgY3R4LT5ub193YWl0X2dwdSwgbG9j
a2VkKTsKPj4+ICAgCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlz
dCk7Cj4+PiArCQlpZiAoZmlyc3RfYm8pCj4+PiArCQkJdHRtX2JvX3B1dChmaXJzdF9ibyk7Cj4+
PiAgIAkJcmV0dXJuIHJldDsKPj4+ICAgCX0KPj4+ICAgCj4+PiAgIAl0dG1fYm9fZGVsX2Zyb21f
bHJ1KGJvKTsKPj4+ICAgCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+PiArCWlmIChm
aXJzdF9ibykKPj4+ICsJCXR0bV9ib19wdXQoZmlyc3RfYm8pOwo+Pj4gICAKPj4+ICAgCXJldCA9
IHR0bV9ib19ldmljdChibywgY3R4KTsKPj4+ICAgCWlmIChsb2NrZWQpIHsKPj4+IEBAIC05MDcs
NyArOTg0LDcgQEAgc3RhdGljIGludCB0dG1fYm9fbWVtX2ZvcmNlX3NwYWNlKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sCj4+PiAgIAkJCXJldHVybiByZXQ7Cj4+PiAgIAkJaWYgKG1lbS0+
bW1fbm9kZSkKPj4+ICAgCQkJYnJlYWs7Cj4+PiAtCQlyZXQgPSB0dG1fbWVtX2V2aWN0X2ZpcnN0
KGJkZXYsIG1lbV90eXBlLCBwbGFjZSwgY3R4KTsKPj4+ICsJCXJldCA9IHR0bV9tZW1fZXZpY3Rf
Zmlyc3QoYmRldiwgbWVtX3R5cGUsIHBsYWNlLCBjdHgsIGJvLT5yZXN2KTsKPj4+ICAgCQlpZiAo
dW5saWtlbHkocmV0ICE9IDApKQo+Pj4gICAJCQlyZXR1cm4gcmV0Owo+Pj4gICAJfSB3aGlsZSAo
MSk7Cj4+PiBAQCAtMTQwMSw3ICsxNDc4LDggQEAgc3RhdGljIGludCB0dG1fYm9fZm9yY2VfbGlz
dF9jbGVhbihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPj4+ICAgCWZvciAoaSA9IDA7IGkg
PCBUVE1fTUFYX0JPX1BSSU9SSVRZOyArK2kpIHsKPj4+ICAgCQl3aGlsZSAoIWxpc3RfZW1wdHko
Jm1hbi0+bHJ1W2ldKSkgewo+Pj4gICAJCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+
Pj4gLQkJCXJldCA9IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRldiwgbWVtX3R5cGUsIE5VTEwsICZj
dHgpOwo+Pj4gKwkJCXJldCA9IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRldiwgbWVtX3R5cGUsIE5V
TEwsICZjdHgsCj4+PiArCQkJCQkJICBOVUxMKTsKPj4+ICAgCQkJaWYgKHJldCkKPj4+ICAgCQkJ
CXJldHVybiByZXQ7Cj4+PiAgIAkJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+Pj4gQEAg
LTE3NzIsNyArMTg1MCw4IEBAIGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX2JvX2dsb2Jh
bCAqZ2xvYiwgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCj4+PiAgIAlzcGluX2xvY2so
Jmdsb2ItPmxydV9sb2NrKTsKPj4+ICAgCWZvciAoaSA9IDA7IGkgPCBUVE1fTUFYX0JPX1BSSU9S
SVRZOyArK2kpIHsKPj4+ICAgCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJvLCAmZ2xvYi0+c3dhcF9s
cnVbaV0sIHN3YXApIHsKPj4+IC0JCQlpZiAodHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxl
KGJvLCBjdHgsICZsb2NrZWQpKSB7Cj4+PiArCQkJaWYgKHR0bV9ib19ldmljdF9zd2Fwb3V0X2Fs
bG93YWJsZShibywgY3R4LCAmbG9ja2VkLAo+Pj4gKwkJCQkJCQkgICBOVUxMKSkgewo+Pj4gICAJ
CQkJcmV0ID0gMDsKPj4+ICAgCQkJCWJyZWFrOwo+Pj4gICAJCQl9Cj4+PiAtLSAKPj4+IDIuMTcu
MQo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo+PiAtLSAKPj4gRGFuaWVsIFZldHRlcgo+PiBTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KPj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
