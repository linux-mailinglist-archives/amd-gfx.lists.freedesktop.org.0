Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7056E1D
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 17:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DCA6E482;
	Wed, 26 Jun 2019 15:56:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ABB6E484
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 15:56:10 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r12so4053704edo.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 08:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=b8N0XuHLMqrJQXmLm+2uSL4Ak/YQzhUfppEvcpxNhdU=;
 b=dqI36cxe1RNrn8F2S9tfnUsSPwGGCJu/nbRH6yUTeQKCaJ2xJGDmAQkUdedXqcSHvM
 BsV1nlDN7rFgsxMxMxOJ94xQUWh6PEiCWcbe32GGExbd+f1dhOKW+ZhKk/U/apdg+c2P
 JgS2usva+c1dMKXocEEz/nzhEt7ywl+JAQLI54zKN/f6MgjLYIvojE0ZDdvQfOb+IweJ
 ssOq5B62f4hoAIHIHR0fEJzGKmcAIg7N4eBDLTCNK0LtTyy0uTcnUzgk/1zKarX+OIMs
 aGXmQ3r2kNkBZh0HyOTZM8LDG/bgVDq35qL7CP7jarxfY3Et7uMwb4jDUnEWJ6qtzlOQ
 5S+w==
X-Gm-Message-State: APjAAAVTylTfCuEX+iDgE8GaRexJVKSQStD3pSEOTtLTgmbuLdiWH4ej
 iLMnQzbGnCKJcCVgzFrZB+qaBA==
X-Google-Smtp-Source: APXvYqxj5iQ8cgJzXif/pPyy4Sja3143s1j9ggVAk9qGMS7fXVtVMugZW1UWF3d14w6P7GQnc9gk+A==
X-Received: by 2002:a05:6402:397:: with SMTP id
 o23mr6350378edv.68.1561564568630; 
 Wed, 26 Jun 2019 08:56:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n5sm3050587ejc.62.2019.06.26.08.56.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 08:56:07 -0700 (PDT)
Date: Wed, 26 Jun 2019 17:56:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [RFC PATCH v3 02/11] cgroup: Add mechanism to register DRM devices
Message-ID: <20190626155605.GQ12905@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-3-Kenny.Ho@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626150522.11618-3-Kenny.Ho@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b8N0XuHLMqrJQXmLm+2uSL4Ak/YQzhUfppEvcpxNhdU=;
 b=N7ULXVSeuODxCVqizNpydWEDzjxIgR+bf2Gz5O2lwAQCWTmMUcdKhVnghCAIua43V/
 qIuHcSxiSBaJQop5snrzrT1vj6L9KTfwLQFamSsk9zblhONsYs1kPGWFcQcsAG0wk46C
 b25QJr8CvO1ih8AlI7876pz2KuENh1VppYoos=
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
Cc: jsparks@cray.com, amd-gfx@lists.freedesktop.org, lkaplan@cray.com,
 alexander.deucher@amd.com, y2kenny@gmail.com, dri-devel@lists.freedesktop.org,
 joseph.greathouse@amd.com, tj@kernel.org, cgroups@vger.kernel.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6MDU6MTNBTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gQ2hhbmdlLUlkOiBJOTA4ZWU2OTc1ZWEwNTg1ZTRjMzBlYWZkZTQ1OTlmODcwOTRkOGM2NQo+
IFNpZ25lZC1vZmYtYnk6IEtlbm55IEhvIDxLZW5ueS5Ib0BhbWQuY29tPgoKV2h5IHRoZSBzZXBh
cmF0ZSwgZXhwbGljaXQgcmVnaXN0cmF0aW9uIHN0ZXA/IEkgdGhpbmsgYSBzaW1wbGVyIGRlc2ln
biBmb3IKZHJpdmVycyB3b3VsZCBiZSB0aGF0IHdlIHNldCB1cCBjZ3JvdXBzIGlmIHRoZXJlJ3Mg
YW55dGhpbmcgdG8gYmUKY29udHJvbGxlZCwgYW5kIHRoZW4gZm9yIEdFTSBkcml2ZXJzIHRoZSBi
YXNpYyBHRU0gc3R1ZmYgd291bGQgYmUgc2V0IHVwCmF1dG9taWNhbGx5ICh0aGVyZSdzIHJlYWxs
eSBubyByZWFzb24gbm90IHRvIEkgdGhpbmspLgoKQWxzbyB0eWluZyB0byB0aGUgbWlub3IgaXMg
YSBiaXQgZnVua3ksIHNpbmNlIHdlIGhhdmUgbXVsdGlwbGUgb2YgdGhlc2UuCk5lZWQgdG8gbWFr
ZSBzdXJlIHdlcmUgYXQgbGVhc3QgY29uc2lzdGVudCB3aXRoIHdoZXRoZXIgd2UgdXNlIHRoZSBw
cmltYXJ5Cm9yIHJlbmRlciBtaW5vciAtIEknZCBhbHdheXMgZ28gd2l0aCB0aGUgcHJpbWFyeSBv
bmUgbGlrZSB5b3UgZG8gaGVyZS4KCj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9jZ3JvdXAuaCAg
IHwgIDI0ICsrKysrKysrCj4gIGluY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oIHwgIDEwICsrKysK
PiAga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgfCAxMTYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fY2dyb3VwLmgKPiAKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5o
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmRkYjllYWI2NDM2
MAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY2dyb3VwLmgKPiBAQCAt
MCwwICsxLDI0IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQKPiArICogQ29w
eXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgo+ICsgKi8KPiArI2lmbmRl
ZiBfX0RSTV9DR1JPVVBfSF9fCj4gKyNkZWZpbmUgX19EUk1fQ0dST1VQX0hfXwo+ICsKPiArI2lm
ZGVmIENPTkZJR19DR1JPVVBfRFJNCj4gKwo+ICtpbnQgZHJtY2dycF9yZWdpc3Rlcl9kZXZpY2Uo
c3RydWN0IGRybV9kZXZpY2UgKmRldmljZSk7Cj4gKwo+ICtpbnQgZHJtY2dycF91bnJlZ2lzdGVy
X2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2aWNlKTsKPiArCj4gKyNlbHNlCj4gK3N0YXRp
YyBpbmxpbmUgaW50IGRybWNncnBfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXZpY2UpCj4gK3sKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGludCBk
cm1jZ3JwX3VucmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXZpY2UpCj4gK3sK
PiArCXJldHVybiAwOwo+ICt9Cj4gKyNlbmRpZiAvKiBDT05GSUdfQ0dST1VQX0RSTSAqLwo+ICsj
ZW5kaWYgLyogX19EUk1fQ0dST1VQX0hfXyAqLwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2Nncm91cF9kcm0uaCBiL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oCj4gaW5kZXggOTkyOGU2
MDAzN2E1Li4yNzQ5N2Y3ODZjOTMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9jZ3JvdXBf
ZHJtLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaAo+IEBAIC02LDEwICs2LDIw
IEBACj4gIAo+ICAjaWZkZWYgQ09ORklHX0NHUk9VUF9EUk0KPiAgCj4gKyNpbmNsdWRlIDxsaW51
eC9tdXRleC5oPgo+ICAjaW5jbHVkZSA8bGludXgvY2dyb3VwLmg+Cj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX2ZpbGUuaD4KPiArCj4gKy8qIGxpbWl0IGRlZmluZWQgcGVyIHRoZSB3YXkgZHJtX21pbm9y
X2FsbG9jIG9wZXJhdGVzICovCj4gKyNkZWZpbmUgTUFYX0RSTV9ERVYgKDY0ICogRFJNX01JTk9S
X1JFTkRFUikKPiArCj4gK3N0cnVjdCBkcm1jZ3JwX2RldmljZV9yZXNvdXJjZSB7Cj4gKwkvKiBm
b3IgcGVyIGRldmljZSBzdGF0cyAqLwo+ICt9Owo+ICAKPiAgc3RydWN0IGRybWNncnAgewo+ICAJ
c3RydWN0IGNncm91cF9zdWJzeXNfc3RhdGUJY3NzOwo+ICsJc3RydWN0IGRybWNncnBfZGV2aWNl
X3Jlc291cmNlCSpkZXZfcmVzb3VyY2VzW01BWF9EUk1fREVWXTsKPiAgfTsKPiAgCj4gIHN0YXRp
YyBpbmxpbmUgc3RydWN0IGRybWNncnAgKmNzc19kcm1jZ3JwKHN0cnVjdCBjZ3JvdXBfc3Vic3lz
X3N0YXRlICpjc3MpCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9rZXJuZWwv
Y2dyb3VwL2RybS5jCj4gaW5kZXggNjZjYjFkZGEwMjNkLi43ZGE2ZTBkOTM5OTEgMTAwNjQ0Cj4g
LS0tIGEva2VybmVsL2Nncm91cC9kcm0uYwo+ICsrKyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMKPiBA
QCAtMSwyOCArMSw5OSBAQAo+ICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUCj4gIC8v
IENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4KPiArI2luY2x1ZGUg
PGxpbnV4L2V4cG9ydC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAjaW5jbHVkZSA8
bGludXgvY2dyb3VwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9mcy5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvc2VxX2ZpbGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9jZ3JvdXBfZHJtLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1
ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Nncm91cC5oPgo+ICsK
PiArc3RhdGljIERFRklORV9NVVRFWChkcm1jZ3JwX211dGV4KTsKPiArCj4gK3N0cnVjdCBkcm1j
Z3JwX2RldmljZSB7Cj4gKwlzdHJ1Y3QgZHJtX2RldmljZQkqZGV2Owo+ICsJc3RydWN0IG11dGV4
CQltdXRleDsKPiArfTsKPiArCj4gKy8qIGluZGV4ZWQgYnkgZHJtX21pbm9yIGZvciBhY2Nlc3Mg
c3BlZWQgKi8KPiArc3RhdGljIHN0cnVjdCBkcm1jZ3JwX2RldmljZQkqa25vd25fZHJtY2dycF9k
ZXZzW01BWF9EUk1fREVWXTsKPiArCj4gK3N0YXRpYyBpbnQgbWF4X21pbm9yOwoKVWggbm8gZ2xv
YmFsIHN0dWZmIGxpa2UgdGhpcyBwbGVhc2UuIE9yIHNvbWUgZXhwbGFuYXRpb24gaW4gdGhlIGNv
bW1pdAptZXNzYWdlIHdoeSB3ZSByZWFsbHkgY2FudCBhdm9pZCB0aGlzLgoKPiArCj4gIAo+ICBz
dGF0aWMgc3RydWN0IGRybWNncnAgKnJvb3RfZHJtY2dycCBfX3JlYWRfbW9zdGx5Owo+ICAKPiAg
c3RhdGljIHZvaWQgZHJtY2dycF9jc3NfZnJlZShzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAq
Y3NzKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycCA9IGNzc19kcm1jZ3JwKGNzcyk7
Cj4gKwlpbnQgaTsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDw9IG1heF9taW5vcjsgaSsrKSB7Cj4g
KwkJaWYgKGRybWNncnAtPmRldl9yZXNvdXJjZXNbaV0gIT0gTlVMTCkKPiArCQkJa2ZyZWUoZHJt
Y2dycC0+ZGV2X3Jlc291cmNlc1tpXSk7Cj4gKwl9Cj4gIAo+ICAJa2ZyZWUoZHJtY2dycCk7Cj4g
IH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgaW50IGluaXRfZHJtY2dycF9zaW5nbGUoc3RydWN0IGRy
bWNncnAgKmRybWNncnAsIGludCBtaW5vcikKPiArewo+ICsJc3RydWN0IGRybWNncnBfZGV2aWNl
X3Jlc291cmNlICpkZHIgPSBkcm1jZ3JwLT5kZXZfcmVzb3VyY2VzW21pbm9yXTsKPiArCj4gKwlp
ZiAoZGRyID09IE5VTEwpIHsKPiArCQlkZHIgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZHJtY2dy
cF9kZXZpY2VfcmVzb3VyY2UpLAo+ICsJCQlHRlBfS0VSTkVMKTsKPiArCj4gKwkJaWYgKCFkZHIp
Cj4gKwkJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCQlkcm1jZ3JwLT5kZXZfcmVzb3VyY2VzW21p
bm9yXSA9IGRkcjsKPiArCX0KPiArCj4gKwkvKiBzZXQgZGVmYXVsdHMgaGVyZSAqLwo+ICsKPiAr
CXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGludCBpbml0X2RybWNncnAoc3Ry
dWN0IGRybWNncnAgKmRybWNncnAsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gK3sKPiArCWlu
dCByYyA9IDA7Cj4gKwlpbnQgaTsKPiArCj4gKwlpZiAoZGV2ICE9IE5VTEwpIHsKPiArCQlyYyA9
IGluaXRfZHJtY2dycF9zaW5nbGUoZHJtY2dycCwgZGV2LT5wcmltYXJ5LT5pbmRleCk7Cj4gKwkJ
cmV0dXJuIHJjOwo+ICsJfQo+ICsKPiArCWZvciAoaSA9IDA7IGkgPD0gbWF4X21pbm9yOyBpKysp
IHsKPiArCQlyYyA9IGluaXRfZHJtY2dycF9zaW5nbGUoZHJtY2dycCwgaSk7Cj4gKwkJaWYgKHJj
KQo+ICsJCQlyZXR1cm4gcmM7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0
YXRpYyBzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAqCj4gIGRybWNncnBfY3NzX2FsbG9jKHN0
cnVjdCBjZ3JvdXBfc3Vic3lzX3N0YXRlICpwYXJlbnRfY3NzKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJt
Y2dycCAqcGFyZW50ID0gY3NzX2RybWNncnAocGFyZW50X2Nzcyk7Cj4gIAlzdHJ1Y3QgZHJtY2dy
cCAqZHJtY2dycDsKPiArCWludCByYzsKPiAgCj4gIAlkcm1jZ3JwID0ga3phbGxvYyhzaXplb2Yo
c3RydWN0IGRybWNncnApLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghZHJtY2dycCkKPiAgCQlyZXR1
cm4gRVJSX1BUUigtRU5PTUVNKTsKPiAgCj4gKwlyYyA9IGluaXRfZHJtY2dycChkcm1jZ3JwLCBO
VUxMKTsKPiArCWlmIChyYykgewo+ICsJCWRybWNncnBfY3NzX2ZyZWUoJmRybWNncnAtPmNzcyk7
Cj4gKwkJcmV0dXJuIEVSUl9QVFIocmMpOwo+ICsJfQo+ICsKPiAgCWlmICghcGFyZW50KQo+ICAJ
CXJvb3RfZHJtY2dycCA9IGRybWNncnA7Cj4gIAo+IEBAIC00MCwzICsxMTEsNDggQEAgc3RydWN0
IGNncm91cF9zdWJzeXMgZHJtX2NncnBfc3Vic3lzID0gewo+ICAJLmxlZ2FjeV9jZnR5cGVzCT0g
ZmlsZXMsCj4gIAkuZGZsX2NmdHlwZXMJPSBmaWxlcywKPiAgfTsKPiArCj4gK2ludCBkcm1jZ3Jw
X3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQoKSW1vIHRoaXMgc2hvdWxk
IGJlIGRvbmUgYXMgcGFydCBvZiBkcm1fZGV2X3JlZ2lzdGVyIChtYXliZSBvbmx5IGlmIHRoZQpk
cml2ZXIgaGFzIHNldCB1cCBhIGNvbnRyb2xsZXIgb3Igc29tZXRoaW5nKS4gRGVmaW5pdGVseSB3
aXRoIHRoZQp1bnJlZ2lzdGVyIGxvZ2ljIGJlbG93LiBBbHNvIGFueXRoaW5nIHVzZWQgYnkgZHJp
dmVycyBuZWVkcyBrZXJuZWxkb2MuCgoKPiArewo+ICsJc3RydWN0IGRybWNncnBfZGV2aWNlICpk
ZGV2Owo+ICsKPiArCWRkZXYgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZHJtY2dycF9kZXZpY2Up
LCBHRlBfS0VSTkVMKTsKPiArCWlmICghZGRldikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4g
KwlkZGV2LT5kZXYgPSBkZXY7Cj4gKwltdXRleF9pbml0KCZkZGV2LT5tdXRleCk7Cj4gKwo+ICsJ
bXV0ZXhfbG9jaygmZHJtY2dycF9tdXRleCk7Cj4gKwlrbm93bl9kcm1jZ3JwX2RldnNbZGV2LT5w
cmltYXJ5LT5pbmRleF0gPSBkZGV2Owo+ICsJbWF4X21pbm9yID0gbWF4KG1heF9taW5vciwgZGV2
LT5wcmltYXJ5LT5pbmRleCk7Cj4gKwltdXRleF91bmxvY2soJmRybWNncnBfbXV0ZXgpOwo+ICsK
PiArCS8qIGluaXQgY2dyb3VwcyBjcmVhdGVkIGJlZm9yZSByZWdpc3RyYXRpb24gKGkuZS4gcm9v
dCBjZ3JvdXApICovCj4gKwlpZiAocm9vdF9kcm1jZ3JwICE9IE5VTEwpIHsKPiArCQlzdHJ1Y3Qg
Y2dyb3VwX3N1YnN5c19zdGF0ZSAqcG9zOwo+ICsJCXN0cnVjdCBkcm1jZ3JwICpjaGlsZDsKPiAr
Cj4gKwkJcmN1X3JlYWRfbG9jaygpOwo+ICsJCWNzc19mb3JfZWFjaF9kZXNjZW5kYW50X3ByZShw
b3MsICZyb290X2RybWNncnAtPmNzcykgewo+ICsJCQljaGlsZCA9IGNzc19kcm1jZ3JwKHBvcyk7
Cj4gKwkJCWluaXRfZHJtY2dycChjaGlsZCwgZGV2KTsKPiArCQl9Cj4gKwkJcmN1X3JlYWRfdW5s
b2NrKCk7CgpJIGhhdmUgbm8gaWRlYSwgYnV0IGlzIHRoaXMgZ3VhcmFudGVlZCB0byBnZXQgdGhl
bSBhbGw/Ci1EYW5pZWwKCj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArRVhQT1JUX1NZ
TUJPTChkcm1jZ3JwX3JlZ2lzdGVyX2RldmljZSk7Cj4gKwo+ICtpbnQgZHJtY2dycF91bnJlZ2lz
dGVyX2RldmljZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICt7Cj4gKwltdXRleF9sb2NrKCZk
cm1jZ3JwX211dGV4KTsKPiArCj4gKwlrZnJlZShrbm93bl9kcm1jZ3JwX2RldnNbZGV2LT5wcmlt
YXJ5LT5pbmRleF0pOwo+ICsJa25vd25fZHJtY2dycF9kZXZzW2Rldi0+cHJpbWFyeS0+aW5kZXhd
ID0gTlVMTDsKPiArCj4gKwltdXRleF91bmxvY2soJmRybWNncnBfbXV0ZXgpOwo+ICsJcmV0dXJu
IDA7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1jZ3JwX3VucmVnaXN0ZXJfZGV2aWNlKTsKPiAt
LSAKPiAyLjIxLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
