Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E16375F8A
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 09:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8556E896;
	Fri, 26 Jul 2019 07:17:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E359C6E896
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 07:17:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p74so47009688wme.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 00:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=E7yaxehB52PXL9aDlZv9EKmPAHHrzRds33JT3ZTc298=;
 b=oEZOuiPajyhl9lyCWxL2MTJJAV/HKjjY1xvVP+Vkjp3Ml3rpF+YwM5HR++DXn8bYqW
 ASacLuRttmAeyMpjNxY84+8GQdl/UcsJho+kIoSsDrAAHLN5nMdeisj6aGPZsGfvNChA
 whiooId+n4cjn+V2IllRcHEXcrPWz6JIvKkM30ARxNUZeDI0L9bOrl5NJuJLTOibmpfg
 cSVtWi6To27qay2EB37IL7Nk0grRlHljZ21Xh80BmjDMj4qeRtscCUnuXwMerkRp7JkV
 /pFGwX3EnlSuu7lZcICHlxWK0iBnOZeA//RBPn0gVsaGKMZbnUb9MBBx2A5MxeCOyp7q
 cI1Q==
X-Gm-Message-State: APjAAAV10GO1PZCS2GSjePKaP4qCabjNCKwdbP/eNEN2PrzlhofztV5r
 3wfQTJM8oyJlUnaOBuF/aRSj7ie4
X-Google-Smtp-Source: APXvYqwSvFUicRFUZunZGM+rB0E5X9aqaacQghMKKL0EepVP1PtBD9mWFYQBQWW/JtbUHeytH7oKOg==
X-Received: by 2002:a1c:7e90:: with SMTP id
 z138mr80618715wmc.128.1564125442240; 
 Fri, 26 Jul 2019 00:17:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g19sm58869283wmg.10.2019.07.26.00.17.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 00:17:21 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
To: "Thai, Thong" <Thong.Thai@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190725155204.5739-1-thong.thai@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2a7d972a-5916-7d00-c8ad-5ff33363d993@gmail.com>
Date: Fri, 26 Jul 2019 09:17:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725155204.5739-1-thong.thai@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=E7yaxehB52PXL9aDlZv9EKmPAHHrzRds33JT3ZTc298=;
 b=iXLs20Sc05eWYM4N0+XQKhvI7xwOgALaEPu0Yff2TQE2J/Dym3dIt+muz5TygTyMWS
 3F1o8DMYfVLK3JwVtfxRjRKE+3jwF2YLPzxV5NihUabGbFH2glSYlK5/bRphOeRkCCBa
 7EHPssDaZORM+92GIjhTTOdDYwY9pl8W0sK4aI5h7Z4Xsdk4KND1BAQEkVBU5BLERgX7
 QwWpieG8ediBBatb2kaUnv63Lhvzsp7Y4LARVz1gV5zcOkLtoNQ1tckAemEWbqeJ6Pj/
 XJ6aNiFlJ58ocNN5Fmct7JDPTvkj5rCPVxP3o1fgg/dcfL1IDRz9vL5rMkT6XXXRSzgx
 gAZA==
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

QW0gMjUuMDcuMTkgdW0gMTc6NTIgc2NocmllYiBUaGFpLCBUaG9uZzoKPiBTZXRzIHRoZSBDTURf
U09VUkNFIGJpdCBmb3IgVkNOIDIuMCBEZWNvZGVyIFJpbmcgQnVmZmVyIGNvbW1hbmRzLiBUaGlz
Cj4gYml0IHdhcyBwcmV2aW91c2x5IHNldCBieSB0aGUgUkJDIEhXIG9uIG9sZGVyIGZpcm13YXJl
LiBOZXdlciBmaXJtd2FyZQo+IHVzZXMgYSBTVyBSQkMgYW5kIHRoaXMgYml0IGhhcyB0byBiZSBz
ZXQgYnkgdGhlIGRyaXZlci4KCk1obSwgYW5vdGhlciBxdWVzdGlvbiBjYW1lIHRvIG15IG1pbmQ6
IFdvdWxkIGl0IG5vdyBiZSBwb3NzaWJsZSBmb3IgdXNlciAKc3BhY2UgdG8gc2V0IHRoaXMgZmxh
ZyBhbmQgYW5kIGdhaW4gYWNjZXNzIHRvIHRoZSBrZXJuZWwgZHJpdmVyIGNvbW1hbmRzPwoKQ2F1
c2UgdGhhdCBjb3VsZCBiZSBhIHNlY3VyaXR5IHByb2JsZW0uCgpDaHJpc3RpYW4uCgo+Cj4gU2ln
bmVkLW9mZi1ieTogVGhvbmcgVGhhaSA8dGhvbmcudGhhaUBhbWQuY29tPgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIHwgIDEgKwo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyAgIHwgMTIgKysrKysrLS0tLS0tCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKPiBpbmRleCA1ZTI0NTNlZTZiMjkuLjRkM2Jm
NGFkZjFlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKPiBA
QCAtMzAsNiArMzAsNyBAQAo+ICAgI2RlZmluZSBBTURHUFVfVkNOX0ZJUk1XQVJFX09GRlNFVAky
NTYKPiAgICNkZWZpbmUgQU1ER1BVX1ZDTl9NQVhfRU5DX1JJTkdTCTMKPiAgIAo+ICsjZGVmaW5l
IFZDTl9ERUNfS01EX0NNRAkJCTB4ODAwMDAwMDAKPiAgICNkZWZpbmUgVkNOX0RFQ19DTURfRkVO
Q0UJCTB4MDAwMDAwMDAKPiAgICNkZWZpbmUgVkNOX0RFQ19DTURfVFJBUAkJMHgwMDAwMDAwMQo+
ICAgI2RlZmluZSBWQ05fREVDX0NNRF9XUklURV9SRUcJCTB4MDAwMDAwMDQKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKPiBpbmRleCBiYzk3MjY3ODdjOTcuLjcwOTFhZWY5NWZm
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwo+IEBAIC0xNDg4LDcg
KzE0ODgsNyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3RhcnQoc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nKQo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tF
VDAobW1VVkRfR1BDT01fVkNQVV9EQVRBMF9JTlRFUk5BTF9PRkZTRVQsIDApKTsKPiAgIAlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCAwKTsKPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNL
RVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFMX09GRlNFVCwgMCkpOwo+IC0JYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19DTURfUEFDS0VUX1NUQVJUIDw8IDEpOwo+ICsJYW1k
Z3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19LTURfQ01EIHwgKFZDTl9ERUNfQ01EX1BBQ0tF
VF9TVEFSVCA8PCAxKSk7Cj4gICB9Cj4gICAKPiAgIC8qKgo+IEBAIC0xNTAxLDcgKzE1MDEsNyBA
QCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3RhcnQoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nKQo+ICAgc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X2Vu
ZChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4gICB7Cj4gICAJYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgUEFDS0VUMChtbVVWRF9HUENPTV9WQ1BVX0NNRF9JTlRFUk5BTF9PRkZTRVQsIDApKTsK
PiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfQ01EX1BBQ0tFVF9FTkQgPDwgMSk7
Cj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0tNRF9DTUQgfCAoVkNOX0RFQ19D
TURfUEFDS0VUX0VORCA8PCAxKSk7Cj4gICB9Cj4gICAKPiAgIC8qKgo+IEBAIC0xNTQ2LDcgKzE1
NDYsNyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2ZlbmNlKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywgdTY0IGFkZHIsIHU2NAo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIHVwcGVyXzMyX2JpdHMoYWRkcikgJiAweGZmKTsKPiAgIAo+ICAgCWFtZGdwdV9yaW5nX3dy
aXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAw
KSk7Cj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0NNRF9GRU5DRSA8PCAxKTsK
PiArCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfS01EX0NNRCB8IChWQ05fREVDX0NN
RF9GRU5DRSA8PCAxKSk7Cj4gICAKPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQw
KG1tVVZEX0dQQ09NX1ZDUFVfREFUQTBfSU5URVJOQUxfT0ZGU0VULCAwKSk7Cj4gICAJYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgMCk7Cj4gQEAgLTE1NTYsNyArMTU1Niw3IEBAIHN0YXRpYyB2b2lk
IHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfZmVuY2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1
NjQgYWRkciwgdTY0Cj4gICAKPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1t
VVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFMX09GRlNFVCwgMCkpOwo+ICAgCj4gLQlhbWRncHVf
cmluZ193cml0ZShyaW5nLCBWQ05fREVDX0NNRF9UUkFQIDw8IDEpOwo+ICsJYW1kZ3B1X3Jpbmdf
d3JpdGUocmluZywgVkNOX0RFQ19LTURfQ01EIHwgKFZDTl9ERUNfQ01EX1RSQVAgPDwgMSkpOwo+
ICAgfQo+ICAgCj4gICAvKioKPiBAQCAtMTYwMCw3ICsxNjAwLDcgQEAgc3RhdGljIHZvaWQgdmNu
X3YyXzBfZGVjX3JpbmdfZW1pdF9yZWdfd2FpdChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4g
ICAKPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVf
Q01EX0lOVEVSTkFMX09GRlNFVCwgMCkpOwo+ICAgCj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5n
LCBWQ05fREVDX0NNRF9SRUdfUkVBRF9DT05EX1dBSVQgPDwgMSk7Cj4gKwlhbWRncHVfcmluZ193
cml0ZShyaW5nLCBWQ05fREVDX0tNRF9DTUQgfCAoVkNOX0RFQ19DTURfUkVHX1JFQURfQ09ORF9X
QUlUIDw8IDEpKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3Jpbmdf
ZW1pdF92bV9mbHVzaChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4gQEAgLTE2MjksNyArMTYy
OSw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfd3JlZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsCj4gICAKPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQw
KG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFMX09GRlNFVCwgMCkpOwo+ICAgCj4gLQlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0NNRF9XUklURV9SRUcgPDwgMSk7Cj4gKwlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0tNRF9DTUQgfCAoVkNOX0RFQ19DTURfV1JJVEVf
UkVHIDw8IDEpKTsKPiAgIH0KPiAgIAo+ICAgLyoqCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
