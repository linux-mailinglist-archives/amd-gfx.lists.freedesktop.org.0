Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C4162BE
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 13:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0116E7A6;
	Tue,  7 May 2019 11:24:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B14E6E7A5;
 Tue,  7 May 2019 11:24:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r4so6507086wro.10;
 Tue, 07 May 2019 04:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Cd70wVbTxAe6b6jS3GkrQc17EgQP9xCa13SkhZFzzO8=;
 b=oZSpWS0Qh0zEUDFY8it1gE8waGfJAx/0kqpS1V5XuS/mkOFfHgEq2fPW2gtQbhkuaI
 lCtgDEdqNySECTsdcPTBJkJqKB5/0xvyImgDBmp3AH5YFuZEEg5fuyysfKXhTrD/Nd7D
 qmhbrJHfz+qblOdW2/kS6CwqEuCzLSSvteOp5Jg53wC+QSt3tqods6Y2vF6ykqzBjr8t
 fV3LaVnRhVXzq2jFxqabtk59Jyzc5bKNQpc1jip+T9t+gmOF6w7S0r6NkWSqCnVRJANq
 RuCgvgF+Cs1WKVAkcYyI3bPdlm12XaHCnGuGpE8lkvUiI1G4Yhoq6ron+fclHamh+dPf
 HfJw==
X-Gm-Message-State: APjAAAUKiUyEC1xgXYD7yQXvptYXOl+ikkJv1JuKj/j1L9+V4ydfot8m
 mEqe4YjdSFe9DWQCFL3lXg9kkHtg
X-Google-Smtp-Source: APXvYqxBs8tYY9mOOptZMzBUfakZsdomBN1ZXmP7neMzqWN8fUGz1klthjjH6vqMXBu67Z3JWCanIw==
X-Received: by 2002:adf:fc51:: with SMTP id e17mr21534665wrs.243.1557228296016; 
 Tue, 07 May 2019 04:24:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f138sm5684385wmf.23.2019.05.07.04.24.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 04:24:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v6
To: zhoucm1 <zhoucm1@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190507093642.7859-1-david1.zhou@amd.com>
 <f4b1ddf2-b80b-260e-54c9-b0e62ecbe90b@amd.com>
 <f6a63550-3c1d-41b7-d0c3-98f567695f59@amd.com>
 <6c90881c-1cf3-3b04-c6e0-c6eea5914f9b@amd.com>
 <6c6e5dd5-3264-e4c1-738d-f70cb3346807@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <968487eb-f78e-9922-a073-8ed08111e307@gmail.com>
Date: Tue, 7 May 2019 13:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6c6e5dd5-3264-e4c1-738d-f70cb3346807@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Cd70wVbTxAe6b6jS3GkrQc17EgQP9xCa13SkhZFzzO8=;
 b=nzq8720ucS5irwzheM/CYFxj/ZXNby0Z6WJbOn2DUpNYdJtOIK5mTepF04cqMJU7mN
 0Rl2PJx6qfuMUdgoOA9/m4EZ/XdiBkgjDgzdncCbYds4Tx6u1UACsSGFqt5sgM5cRBqQ
 s3EYda8Fhe7G78bC/UD4w+eRUqT0GYFYNg4DspYyV8mKfaeLZmNY6b3WKXXVH+Jz/o8j
 fT/Ag8HCVNT7AnR4qGe4quZ994j5KDukaV1eRbp9IsQihJfiuqYAc4yTXXrVaOjtOhWp
 HKSCoigDjgkJo4sxyU9s0+2gZy0ebMIGHE/kjzOOLxcJKa7LuEbDDIXwQywgonxo66Rm
 rURg==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDUuMTkgdW0gMTM6MjIgc2NocmllYiB6aG91Y20xOgo+Cj4KPiBPbiAyMDE55bm0MDXm
nIgwN+aXpSAxOToxMywgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+IEFtIDA3LjA1LjE5IHVt
IDEzOjA4IHNjaHJpZWIgemhvdWNtMToKPj4+Cj4+PiBPbiAyMDE55bm0MDXmnIgwN+aXpSAxODo1
MywgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+Pj4gQW0gMDcuMDUuMTkgdW0gMTE6MzYgc2No
cmllYiBDaHVubWluZyBaaG91Ogo+Pj4+PiBoZWF2eSBncHUgam9iIGNvdWxkIG9jY3VweSBtZW1v
cnkgbG9uZyB0aW1lLCB3aGljaCBsZWFkIG90aGVyIHVzZXIKPj4+Pj4gZmFpbCB0byBnZXQgbWVt
b3J5Lgo+Pj4+Pgo+Pj4+PiBiYXNpY2FsbHkgcGljayB1cCBDaHJpc3RpYW4gaWRlYToKPj4+Pj4K
Pj4+Pj4gMS4gUmVzZXJ2ZSB0aGUgQk8gaW4gREMgdXNpbmcgYSB3d19tdXRleCB0aWNrZXQgKHRy
aXZpYWwpLgo+Pj4+PiAyLiBJZiB3ZSB0aGVuIHJ1biBpbnRvIHRoaXMgRUJVU1kgY29uZGl0aW9u
IGluIFRUTSBjaGVjayBpZiB0aGUgQk8KPj4+Pj4gd2UgbmVlZCBtZW1vcnkgZm9yIChvciByYXRo
ZXIgdGhlIHd3X211dGV4IG9mIGl0cyByZXNlcnZhdGlvbgo+Pj4+PiBvYmplY3QpIGhhcyBhIHRp
Y2tldCBhc3NpZ25lZC4KPj4+Pj4gMy4gSWYgd2UgaGF2ZSBhIHRpY2tldCB3ZSBncmFiIGEgcmVm
ZXJlbmNlIHRvIHRoZSBmaXJzdCBCTyBvbiB0aGUKPj4+Pj4gTFJVLCBkcm9wIHRoZSBMUlUgbG9j
ayBhbmQgdHJ5IHRvIGdyYWIgdGhlIHJlc2VydmF0aW9uIGxvY2sgd2l0aCB0aGUKPj4+Pj4gdGlj
a2V0Lgo+Pj4+PiA0LiBJZiBnZXR0aW5nIHRoZSByZXNlcnZhdGlvbiBsb2NrIHdpdGggdGhlIHRp
Y2tldCBzdWNjZWVkZWQgd2UKPj4+Pj4gY2hlY2sgaWYgdGhlIEJPIGlzIHN0aWxsIHRoZSBmaXJz
dCBvbmUgb24gdGhlIExSVSBpbiBxdWVzdGlvbiAodGhlCj4+Pj4+IEJPIGNvdWxkIGhhdmUgbW92
ZWQpLgo+Pj4+PiA1LiBJZiB0aGUgQk8gaXMgc3RpbGwgdGhlIGZpcnN0IG9uZSBvbiB0aGUgTFJV
IGluIHF1ZXN0aW9uIHdlIHRyeSB0bwo+Pj4+PiBldmljdCBpdCBhcyB3ZSB3b3VsZCBldmljdCBh
bnkgb3RoZXIgQk8uCj4+Pj4+IDYuIElmIGFueSBvZiB0aGUgIklmJ3MiIGFib3ZlIGZhaWwgd2Ug
anVzdCBiYWNrIG9mZiBhbmQgcmV0dXJuIAo+Pj4+PiAtRUJVU1kuCj4+Pj4+Cj4+Pj4+IHYyOiBm
aXggc29tZSBtaW5vciBjaGVjawo+Pj4+PiB2MzogYWRkcmVzcyBDaHJpc3RpYW4gdjIgY29tbWVu
dHMuCj4+Pj4+IHY0OiBmaXggc29tZSBtaXNzaW5nCj4+Pj4+IHY1OiBoYW5kbGUgZmlyc3RfYm8g
dW5sb2NrIGFuZCBib19nZXQvcHV0Cj4+Pj4+IHY2OiBhYnN0cmFjdCB1bmlmaWVkIGl0ZXJhdGUg
ZnVuY3Rpb24sIGFuZCBoYW5kbGUgYWxsIHBvc3NpYmxlCj4+Pj4+IHVzZWNhc2Ugbm90IG9ubHkg
cGlubmVkIGJvLgo+Pj4+Pgo+Pj4+PiBDaGFuZ2UtSWQ6IEkyMTQyM2ZiOTIyZjg4NTQ2NWYxMzgz
M2M0MWRmMWUxMzQzNjRhOGU3Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRh
dmlkMS56aG91QGFtZC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoMKgwqAgZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYyB8IDExMwo+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQo+Pj4+PiDCoMKgwqAgMSBmaWxlIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYwo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4gaW5kZXgg
ODUwMmIzZWQyZDg4Li5iYmYxZDE0ZDAwYTcgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Ywo+Pj4+PiBAQCAtNzY2LDExICs3NjYsMTMgQEAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fZXZpY3Rp
b25fdmFsdWFibGUpOwo+Pj4+PiDCoMKgwqDCoCAqIGIuIE90aGVyd2lzZSwgdHJ5bG9jayBpdC4K
Pj4+Pj4gwqDCoMKgwqAgKi8KPj4+Pj4gwqDCoMKgIHN0YXRpYyBib29sIHR0bV9ib19ldmljdF9z
d2Fwb3V0X2FsbG93YWJsZShzdHJ1Y3QKPj4+Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+Pj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwg
Ym9vbCAqbG9ja2VkKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggKmN0eCwgYm9vbCAqbG9ja2VkLCBib29sICpidXN5KQo+Pj4+PiDCoMKgwqAg
ewo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBib29sIHJldCA9IGZhbHNlOwo+Pj4+PiDCoMKgwqAgwqDC
oMKgwqDCoMKgICpsb2NrZWQgPSBmYWxzZTsKPj4+Pj4gK8KgwqDCoCBpZiAoYnVzeSkKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgICpidXN5ID0gZmFsc2U7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmIChi
by0+cmVzdiA9PSBjdHgtPnJlc3YpIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXNl
cnZhdGlvbl9vYmplY3RfYXNzZXJ0X2hlbGQoYm8tPnJlc3YpOwo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChjdHgtPmZsYWdzICYgVFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklDVAo+
Pj4+PiBAQCAtNzc5LDM1ICs3ODEsNDUgQEAgc3RhdGljIGJvb2wKPj4+Pj4gdHRtX2JvX2V2aWN0
X3N3YXBvdXRfYWxsb3dhYmxlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+Pj4+IMKg
wqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmxvY2tl
ZCA9IHJlc2VydmF0aW9uX29iamVjdF90cnlsb2NrKGJvLT5yZXN2KTsKPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXQgPSAqbG9ja2VkOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFy
ZXQgJiYgYnVzeSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmJ1c3kgPSB0cnVlOwo+
Pj4+PiDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoCDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4+Pj4gwqDCoMKgIH0KPj4+Pj4gwqDCoMKgIC1zdGF0aWMgaW50IHR0bV9tZW1fZXZpY3Rf
Zmlyc3Qoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgbWVtX3R5cGUsCj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2Us
Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHR0bV9v
cGVyYXRpb25fY3R4ICpjdHgpCj4+Pj4+ICtzdGF0aWMgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
Kgo+Pj4+PiArdHRtX21lbV9maW5kX2V2aXRhYmxlX2JvKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciAqbWFuLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVj
dCB0dG1fcGxhY2UgKnBsYWNlLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqKmZpcnN0X2JvLAo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJvb2wgKmxvY2tlZCkKPj4+Pj4gwqDCoMKgIHsKPj4+Pj4gLcKgwqDCoCBz
dHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9IGJkZXYtPmdsb2I7Cj4+Pj4+IC3CoMKgwqAgc3Ry
dWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbV90eXBlXTsKPj4+
Pj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IE5VTEw7Cj4+
Pj4+IC3CoMKgwqAgYm9vbCBsb2NrZWQgPSBmYWxzZTsKPj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBp
Owo+Pj4+PiAtwqDCoMKgIGludCByZXQ7Cj4+Pj4+ICvCoMKgwqAgaW50IGk7Cj4+Pj4+IMKgwqDC
oCAtwqDCoMKgIHNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+Pj4+PiArwqDCoMKgIGlmIChm
aXJzdF9ibykKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgICpmaXJzdF9ibyA9IE5VTEw7Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBUVE1fTUFYX0JPX1BSSU9SSVRZOyArK2kpIHsK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGJvLCAmbWFu
LT5scnVbaV0sIGxydSkgewo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXR0bV9i
b19ldmljdF9zd2Fwb3V0X2FsbG93YWJsZShibywgY3R4LCAmbG9ja2VkKSkKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBidXN5ID0gZmFsc2U7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghdHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKGJvLCBjdHgsIGxv
Y2tlZCwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZidXN5KSkgewo+Pj4+IEEgbmV3bGluZSBiZXR3ZWVuIGRlY2xh
cmF0aW9uIGFuZCBjb2RlIHBsZWFzZS4KPj4+Pgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChmaXJzdF9ibyAmJiAhKCpmaXJzdF9ibykgJiYgYnVzeSkgewo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX2JvX2dldChibyk7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqZmlyc3RfYm8gPSBi
bzsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChwbGFjZSAmJiAhYmRldi0+ZHJpdmVyLT5ldmljdGlvbl92YWx1YWJsZShibywKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwbGFjZSkpIHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAobG9ja2VkKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICgqbG9ja2VkKQo+Pj4+PiByZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJv
LT5yZXN2KTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
dGludWU7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICsKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDCoMKgIEBAIC04MTgsOSArODMwLDY2IEBAIHN0YXRpYyBp
bnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QKPj4+Pj4gdHRtX2JvX2RldmljZSAqYmRldiwK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibyA9IE5VTEw7Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgIH0KPj4+Pj4gwqDCoMKgICvCoMKgwqAgcmV0dXJuIGJvOwo+Pj4+PiArfQo+Pj4+PiArCj4+
Pj4+ICtzdGF0aWMgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMy
X3QgbWVtX3R5cGUsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCj4+Pj4+ICt7
Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IgPSBiZGV2LT5nbG9iOwo+
Pj4+PiArwqDCoMKgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJkZXYtPm1h
blttZW1fdHlwZV07Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9
IE5VTEwsICpmaXJzdF9ibyA9IE5VTEw7Cj4+Pj4+ICvCoMKgwqAgYm9vbCBsb2NrZWQgPSBmYWxz
ZTsKPj4+Pj4gK8KgwqDCoCBpbnQgcmV0Owo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgc3Bpbl9sb2Nr
KCZnbG9iLT5scnVfbG9jayk7Cj4+Pj4+ICvCoMKgwqAgYm8gPSB0dG1fbWVtX2ZpbmRfZXZpdGFi
bGVfYm8oYmRldiwgbWFuLCBwbGFjZSwgY3R4LCAmZmlyc3RfYm8sCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmxvY2tlZCk7Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgIGlmICghYm8pIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fb3BlcmF0
aW9uX2N0eCBidXN5X2N0eDsKPj4+Pj4gKwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNw
aW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVCVVNZOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogY2hlY2sgaWYgb3RoZXIgdXNlciBvY2N1
cHkgbWVtb3J5IHRvbyBsb25nIHRpbWUgKi8KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghZmly
c3RfYm8gfHwgIWN0eCB8fCAhY3R4LT5yZXN2IHx8IAo+Pj4+PiAhY3R4LT5yZXN2LT5sb2NrLmN0
eCkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZmlyc3RfYm8pCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX2JvX3B1dChmaXJzdF9ibyk7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUJVU1k7Cj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCB9Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZmlyc3RfYm8tPnJlc3YgPT0gY3R4LT5y
ZXN2KSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9ib19wdXQoZmlyc3RfYm8p
Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVCVVNZOwo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgfQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGN0eC0+aW50ZXJydXB0aWJs
ZSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gd3dfbXV0ZXhfbG9ja19pbnRl
cnJ1cHRpYmxlKCZmaXJzdF9iby0+cmVzdi0+bG9jaywKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3R4LT5yZXN2LT5sb2Nr
LmN0eCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IHd3X211dGV4X2xvY2soJmZpcnN0X2JvLT5yZXN2LT5sb2NrLAo+Pj4+PiBj
dHgtPnJlc3YtPmxvY2suY3R4KTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHRtX2JvX3B1dChmaXJzdF9ibyk7Cj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIC8qIHByZXZpb3VzIGJ1c3kgcmVzdiBsb2NrIGlzIGhlbGQgYnkgYWJv
dmUsIGlkbGUgbm93LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHNvIGxldCB0aGVtIGV2aWN0
YWJsZS4KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJ1
c3lfY3R4LmludGVycnVwdGlibGUgPSBjdHgtPmludGVycnVwdGlibGU7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBidXN5X2N0eC5ub193YWl0X2dwdcKgwqAgPSBjdHgtPm5vX3dhaXRfZ3B1Owo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgYnVzeV9jdHgucmVzdsKgwqDCoMKgwqDCoMKgwqDCoMKgID0gZmly
c3RfYm8tPnJlc3Y7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBidXN5X2N0eC5mbGFnc8KgwqDCoMKg
wqDCoMKgwqDCoMKgID0gVFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklDVDsKPj4+Pj4gKwo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgYm8gPSB0dG1fbWVtX2ZpbmRfZXZpdGFibGVfYm8oYmRldiwgbWFu
LCBwbGFjZSwgJmJ1c3lfY3R4LAo+Pj4+PiBOVUxMLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmxvY2tlZCk7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoYm8gJiYgKGJvLT5yZXN2ID09IGZpcnN0X2JvLT5yZXN2KSkKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9ja2VkID0gdHJ1ZTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGVsc2UgaWYgKGJvKQo+Pj4+PiArIHd3X211dGV4X3VubG9jaygmZmlyc3RfYm8tPnJlc3YtPmxv
Y2spOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFibykgewo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB0dG1fYm9fcHV0KGZpcnN0X2JvKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FQlVTWTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDC
oMKgwqDCoMKgwqAgfQo+Pj4+PiDCoMKgwqAgwqDCoMKgwqDCoMKgIGtyZWZfZ2V0KCZiby0+bGlz
dF9rcmVmKTsKPj4+Pj4gQEAgLTgyOSwxMSArODk4LDE1IEBAIHN0YXRpYyBpbnQgdHRtX21lbV9l
dmljdF9maXJzdChzdHJ1Y3QKPj4+Pj4gdHRtX2JvX2RldmljZSAqYmRldiwKPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSB0dG1fYm9fY2xlYW51cF9yZWZzKGJvLCBjdHgtPmludGVy
cnVwdGlibGUsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGN0eC0+bm9fd2FpdF9ncHUsIGxvY2tlZCk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAga3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOwo+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGZpcnN0X2JvKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB0dG1fYm9fcHV0KGZpcnN0X2JvKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqDCoCDCoMKgwqDC
oMKgwqAgdHRtX2JvX2RlbF9mcm9tX2xydShibyk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHNwaW5f
dW5sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+Pj4+ICvCoMKgwqAgaWYgKGZpcnN0X2JvKQo+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgdHRtX2JvX3B1dChmaXJzdF9ibyk7Cj4+Pj4+IMKgwqDCoCDCoMKg
wqDCoMKgwqAgcmV0ID0gdHRtX2JvX2V2aWN0KGJvLCBjdHgpOwo+Pj4+PiDCoMKgwqDCoMKgwqDC
oCBpZiAobG9ja2VkKSB7Cj4+Pj4+IEBAIC04OTksNiArOTcyLDEzIEBAIHN0YXRpYyBpbnQgdHRt
X2JvX21lbV9mb3JjZV9zcGFjZShzdHJ1Y3QKPj4+Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
Pj4+PiDCoMKgwqAgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX2JvX2RldmljZSAq
YmRldiA9IGJvLT5iZGV2Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bbWVtX3R5cGVdOwo+Pj4+PiArwqDCoMKgIHN0cnVj
dCB0dG1fb3BlcmF0aW9uX2N0eCBuYXRpdmVfY3R4ID0gewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
LmludGVycnVwdGlibGUgPSBmYWxzZSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5ub193YWl0X2dw
dSA9IGZhbHNlLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLnJlc3YgPSBiby0+cmVzdiwKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIC5mbGFncyA9IDAKPj4+Pj4gK8KgwqDCoCB9Owo+Pj4+PiArwqDCoMKg
IHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqZXZpY3RfY3R4ID0gY3R4ID8gY3R4IDogJm5hdGl2
ZV9jdHg7Cj4+Pj4gSSB0aG91Z2h0IHdlIG1hZGUgdGhlIGN0eCBwYXJhbWV0ZXIgbWFuZGF0b3J5
LCBkaWRuJ3Qgd2U/IENvdWxkIGJlIAo+Pj4+IHRoYXQKPj4+PiBJIHJlbWVtYmVyIHRoYXQgaW5j
b3JyZWN0bHkuCj4+PiBQcmlrZSBzYWlkIGhlIHNlZSBjdHgtPnJlc3YgaXMgbnVsbCwgaW4gdGhh
dCBjYXNlLCBjb2RlIGRvZXNuJ3QgcnVuCj4+PiBpbnRvIGJ1c3kgcGF0aC4KPj4+IE9oLCBhcyB5
b3UgbWVudGlvbmVkIGhlcmUsIHdlIG5lZWQgYWRkIC5yZXN2PWJvLT5yZXN2IGZvciBldmVyeQo+
Pj4gdHRtX29wZXJhdGlvbl9jdHguIFRoYXQncyBhIGh1Z2UgY2hhbmdlIHdoaWNoIHdpbGwgY3Jv
c3MgYWxsIHZlbmRvcgo+Pj4gZHJpdmVycy4KPj4+Cj4+PiBDYW4gd2UganVzdCBmb3JjZSB0byBl
dmFsdWF0ZSBldmljdF9jdHgtPnJlc3YgPSBiby0+cmVzdj8gVGhhdCBtZWFucwo+Pj4gd2UganVz
dCBhZGQgb25lIGV4dHJhIGxpbmU6IGV2aWN0X2N0eC0+cmVzdiA9IGJvLT5yZXN2LiBIb3cgYWJv
dXQgdGhhdD8KPj4gV2VsbCBvbmx5IGlmIGN0eC0+cmVzdiBpcyBOVUxMLCBvdGhlcndpc2Ugd2Ug
d291bGQgb3ZlcndyaXRlIHNvbWUKPj4gcmVzZXJ2YXRpb24gY29udGV4dCBnaXZlbiBieSB0aGUg
ZHJpdmVyLgo+Pgo+PiBQcm9iYWJseSBiZXR0ZXIgdG8gZ2l2ZSB0aGUgYWNxdWlyX2N0eCBhcyBz
ZXBhcmF0ZSBwYXJhbWV0ZXIgdG8KPj4gdHRtX21lbV9ldmljdF9maXJzdCgpLgo+IHN0aWxsIHB1
dCBhY3F1aXJlX2N0eCBpbnRvIHR0bV9vcGVyYXRpb25fY3R4PyBUaGVuIHRoYXQncyBzYW1lIGN0
eC0+cmVzdi4KPiBDdXJyZW50IHByb2JsZW0gaXMgd2UgZG9uJ3QgcGFzcyByZXN2IGFueXdoZXJl
IGV4Y2VwdCBBTExPV19FVklDVCBjYXNlLgo+IElmIHlvdSBoYXZlIGNvbmNlcm4gZm9yIG92ZXJ3
cml0dGVuLCB3ZSBoYXZlIHRvIGRvICIucmVzdiA9IGJvLT5yZXN2IiAKPiBpbiBldmVyeSB0dG1f
b3BlcmF0aW9uX2N0eCBkZWZpbml0aW9ucy4KCk5vLCB3aGF0IEkgbWVhbiBpcyB0byBhZGQgdGhl
IGFjcXVpcmVfY3R4IGFzIHNlcGFyYXRlIHBhcmFtZXRlciB0byAKdHRtX21lbV9ldmljdF9maXJz
dCgpLgoKRS5nLiB3ZSBvbmx5IG5lZWQgaXQgaW4gdGhpcyBmdW5jdGlvbiBhbmQgaXQgaXMgYWN0
dWFsbHkgbm90IHJlbGF0ZWQgdG8gCnRoZSB0dG0gb3BlcmF0aW9uIGNvbnRleHQgZmlsbGVkIGlu
IGJ5IHRoZSBkcml2ZXIuCgpDaHJpc3RpYW4uCgo+Cj4gLURhdmlkCj4+Cj4+IENocmlzdGlhbi4K
Pj4KPj4+IC1EYXZpZAo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBp
bnQgcmV0Owo+Pj4+PiDCoMKgwqAgwqDCoMKgwqDCoMKgIGRvIHsKPj4+Pj4gQEAgLTkwNyw3ICs5
ODcsNyBAQCBzdGF0aWMgaW50IHR0bV9ib19tZW1fZm9yY2Vfc3BhY2Uoc3RydWN0Cj4+Pj4+IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG1lbS0+bW1fbm9k
ZSkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+PiAtwqDC
oMKgwqDCoMKgwqAgcmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW1fdHlwZSwgcGxh
Y2UsIGN0eCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSB0dG1fbWVtX2V2aWN0X2ZpcnN0
KGJkZXYsIG1lbV90eXBlLCBwbGFjZSwgZXZpY3RfY3R4KTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAodW5saWtlbHkocmV0ICE9IDApKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+Pj4gwqDCoMKgwqDCoMKgwqAgfSB3aGlsZSAoMSk7
Cj4+Pj4+IEBAIC0xNzg0LDcgKzE4NjQsOCBAQCBpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0
bV9ib19nbG9iYWwgKmdsb2IsCj4+Pj4+IHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4+Pj4gwqDC
oMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7ICsraSkgewo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZnbG9i
LT5zd2FwX2xydVtpXSwgc3dhcCkgewo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKGJvLCBjdHgsICZsb2NrZWQpKSB7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0dG1fYm9fZXZpY3Rfc3dhcG91dF9hbGxvd2Fi
bGUoYm8sIGN0eCwgJmxvY2tlZCwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOVUxMKSkgewo+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAwOwo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
