Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3845896B2A
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 23:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE446E88A;
	Tue, 20 Aug 2019 21:10:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BAF6E88A
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 21:10:01 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C61742A09D4
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 21:10:00 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id e18so8210301qkl.17
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 14:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=IP6vG4Ed8+8Y9JHZM6zQCaSyvnnqhHGnMgojTbzHdeo=;
 b=i7jwzHGdVhp6ahLu6uthO3Yj+Qh0/sqSD+i5fdjUqzsQL+wnErg7oujLH86q8YKCxO
 Ln3OxaM7RVrwTnYbRYez+NkBzqCnFSXkynZ3XXUAVWT1zjvfoQYBizXkarnlsRK5Ha2i
 vzjeIZUpiCVi1A5NUmhxU2YBsawW8yHxgMvndpfukKSQMe0DE7vHISlYyfuXEh1yziRs
 zrm+Q4u8w/8oJIWlvMJHszK8Rg3o0wbQuQ++qHPXztLXU8fHgcWapvjsvk4lIEJAB7I8
 FyGldrl6sibhUjxfvqpghYQN46zmP497uRNNzeJ1gAo1s6y1iHzk2kYeLFoxya3+1dWV
 Q50g==
X-Gm-Message-State: APjAAAUPXxgds1BUV323CdW/FRx+72ADDkkkNHY4ybpLthAy0wv8mdYm
 N7peIRn7Y9p5taz6ePcVYkysHmOTp9P6WeHr0yCMitpdYQMZ75fvqqVUQZz7dA4GhyLaddhm0Kw
 YbsPcHuvmrS65dY0KM8ujelaXAA==
X-Received: by 2002:aed:2b01:: with SMTP id p1mr28526999qtd.33.1566335400029; 
 Tue, 20 Aug 2019 14:10:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0cd5YcxUrRYyWCFfgrsujSZllstDFgwNA9+fq+kRA83kqHivQf5+di6zez2Phh8Lgc2aTfg==
X-Received: by 2002:aed:2b01:: with SMTP id p1mr28526982qtd.33.1566335399779; 
 Tue, 20 Aug 2019 14:09:59 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id m38sm10946373qta.43.2019.08.20.14.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:09:59 -0700 (PDT)
Message-ID: <f7272de2841c61f1297f0fce493efe5dd5317dfa.camel@redhat.com>
Subject: Re: [PATCH v2 14/14] drm/amd/display: Trigger modesets on MST DSC
 connectors
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Tue, 20 Aug 2019 17:09:58 -0400
In-Reply-To: <20190820191203.25807-15-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
 <20190820191203.25807-15-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzaG91bGQgZGVmaW5pdGVseSBiZSBpbXBsZW1lbnRlZCBhcyBhbiBhdG9taWMgaGVscGVy
IGluCmRybV9kcF9tc3RfdG9wb2xvZ3kuYyBhcyB3ZWxsLgoKT24gVHVlLCAyMDE5LTA4LTIwIGF0
IDE1OjEyIC0wNDAwLCBEYXZpZCBGcmFuY2lzIHdyb3RlOgo+IFdoZW5ldmVyIGEgY29ubmVjdG9y
IG9uIGFuIE1TVCBuZXR3b3JrIGlzIGF0dGFjaGVkLCBkZXRhY2hlZCwgb3IKPiB1bmRlcmdvZXMg
YSBtb2Rlc2V0LCB0aGUgRFNDIGNvbmZpZ3MgZm9yIGVhY2ggc3RyZWFtIG9uIHRoYXQKPiB0b3Bv
bG9neSB3aWxsIGJlIHJlY2FsY3VsYXRlZC4gVGhpcyBjYW4gY2hhbmdlIHRoZWlyIHJlcXVpcmVk
Cj4gYmFuZHdpZHRoLCByZXF1aXJpbmcgYSBmdWxsIHJlcHJvZ3JhbW1pbmcsIGFzIHRob3VnaCBh
IG1vZGVzZXQKPiB3YXMgcGVyZm9ybWVkLCBldmVuIGlmIHRoYXQgc3RyZWFtIGRpZCBub3QgY2hh
bmdlIHRpbWluZy4KPiAKPiBUaGVyZWZvcmUsIHdoZW5ldmVyIGEgY3J0YyBoYXMgZHJtX2F0b21p
Y19jcnRjX25lZWRzX21vZGVzZXQsCj4gZm9yIGVhY2ggY3J0YyB0aGF0IHNoYXJlcyBhIE1TVCB0
b3BvbG9neSB3aXRoIHRoYXQgc3RyZWFtIGFuZAo+IHN1cHBvcnRzIERTQywgYWRkIHRoYXQgY3J0
YyAoYW5kIGFsbCBhZmZlY3RlZCBjb25uZWN0b3JzIGFuZAo+IHBsYW5lcykgdG8gdGhlIGF0b21p
YyBzdGF0ZSBhbmQgc2V0IG1vZGVfY2hhbmdlZCBvbiBpdHMgc3RhdGUKPiAKPiB2MjogRG8gdGhp
cyBjaGVjayBvbmx5IG9uIE5hdmkgYW5kIGJlZm9yZSBhZGRpbmcgY29ubmVjdG9ycwo+IGFuZCBw
bGFuZXMgb24gbW9kZXNldHRpbmcgY3J0Y3MKPiAKPiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFt
ZC5jb20+Cj4gQ2M6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1k
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5j
b20+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyB8IDc0ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDc0IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwo+IGluZGV4IDE0NWZkNzMwMjVkYy4uZTY0ZjJhNmViNzFhIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
Cj4gQEAgLTY0NzUsNyArNjQ3NSw3MCBAQCBzdGF0aWMgaW50IGRvX2FxdWlyZV9nbG9iYWxfbG9j
ayhzdHJ1Y3QgZHJtX2RldmljZQo+ICpkZXYsCj4gIAo+ICAJcmV0dXJuIHJldCA8IDAgPyByZXQg
OiAwOwo+ICB9Cj4gKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAo+ICtzdGF0
aWMgaW50IGFkZF9hZmZlY3RlZF9tc3RfZHNjX2NydGNzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSwKPiBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gK3sKPiArCXN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3I7Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9z
dGF0ZTsKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBjb25uX2l0ZXI7Cj4gKwlz
dHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlOwo+ICsJc3RydWN0IGFtZGdwdV9k
bV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSBOVUxMLCAqYWNvbm5lY3Rvcl90b19hZGQ7Cj4gKwlp
bnQgaSwgajsKPiArCXN0cnVjdCBkcm1fY3J0YyAqY3J0Y3NfYWZmZWN0ZWRbQU1ER1BVX01BWF9D
UlRDU10gPSB7IDAgfTsKPiArCj4gKwlmb3JfZWFjaF9uZXdfY29ubmVjdG9yX2luX3N0YXRlKHN0
YXRlLCBjb25uZWN0b3IsIGNvbm5fc3RhdGUsIGkpIHsKPiArCQlpZiAoY29ubl9zdGF0ZS0+Y3J0
YyAhPSBjcnRjKQo+ICsJCQljb250aW51ZTsKPiArCj4gKwkJYWNvbm5lY3RvciA9IHRvX2FtZGdw
dV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKPiArCQlpZiAoIWFjb25uZWN0b3ItPnBvcnQpCj4g
KwkJCWFjb25uZWN0b3IgPSBOVUxMOwo+ICsJCWVsc2UKPiArCQkJYnJlYWs7Cj4gKwl9Cj4gKwo+
ICsJaWYgKCFhY29ubmVjdG9yKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWkgPSAwOwo+ICsJZHJt
X2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oc3RhdGUtPmRldiwgJmNvbm5faXRlcik7Cj4gKwlk
cm1fZm9yX2VhY2hfY29ubmVjdG9yX2l0ZXIoY29ubmVjdG9yLCAmY29ubl9pdGVyKSB7Cj4gKwkJ
aWYgKCFjb25uZWN0b3ItPnN0YXRlIHx8ICFjb25uZWN0b3ItPnN0YXRlLT5jcnRjKQo+ICsJCQlj
b250aW51ZTsKPiArCj4gKwkJYWNvbm5lY3Rvcl90b19hZGQgPSB0b19hbWRncHVfZG1fY29ubmVj
dG9yKGNvbm5lY3Rvcik7Cj4gKwkJaWYgKCFhY29ubmVjdG9yX3RvX2FkZC0+cG9ydCkKPiArCQkJ
Y29udGludWU7Cj4gKwo+ICsJCWlmIChhY29ubmVjdG9yX3RvX2FkZC0+cG9ydC0+bWdyICE9IGFj
b25uZWN0b3ItPnBvcnQtPm1ncikKPiArCQkJY29udGludWU7Cj4gIAo+ICsJCWlmICghYWNvbm5l
Y3Rvcl90b19hZGQtPmRjX3NpbmspCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiArCQlpZiAoIWFjb25u
ZWN0b3JfdG9fYWRkLT5kY19zaW5rLQo+ID5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2Fwcy5pc19k
c2Nfc3VwcG9ydGVkKQo+ICsJCQljb250aW51ZTsKPiArCj4gKwkJaWYgKGkgPj0gQU1ER1BVX01B
WF9DUlRDUykKPiArCQkJY29udGludWU7Cj4gKwo+ICsJCWNydGNzX2FmZmVjdGVkW2ldID0gY29u
bmVjdG9yLT5zdGF0ZS0+Y3J0YzsKPiArCQlpKys7Cj4gKwl9Cj4gKwlkcm1fY29ubmVjdG9yX2xp
c3RfaXRlcl9lbmQoJmNvbm5faXRlcik7Cj4gKwo+ICsJZm9yIChqID0gMDsgaiA8IGk7IGorKykg
ewo+ICsJCW5ld19jcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZShzdGF0ZSwK
PiBjcnRjc19hZmZlY3RlZFtqXSk7Cj4gKwkJaWYgKElTX0VSUihuZXdfY3J0Y19zdGF0ZSkpCj4g
KwkJCXJldHVybiBQVFJfRVJSKG5ld19jcnRjX3N0YXRlKTsKPiArCj4gKwkJbmV3X2NydGNfc3Rh
dGUtPm1vZGVfY2hhbmdlZCA9IHRydWU7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gKwo+ICt9
Cj4gKyNlbmRpZgo+ICBzdGF0aWMgdm9pZCBnZXRfZnJlZXN5bmNfY29uZmlnX2Zvcl9jcnRjKAo+
ICAJc3RydWN0IGRtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlLAo+ICAJc3RydWN0IGRtX2Nv
bm5lY3Rvcl9zdGF0ZSAqbmV3X2Nvbl9zdGF0ZSkKPiBAQCAtNzE2MCw2ICs3MjIzLDE3IEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2RldmljZQo+ICpkZXYs
Cj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gZmFpbDsKPiAgCj4gKyNpZmRlZiBDT05GSUdfRFJNX0FN
RF9EQ19EU0NfU1VQUE9SVAo+ICsJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX05BVkkxMCkg
ewo+ICsJCWZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKHN0YXRlLCBjcnRjLCBvbGRfY3J0
Y19zdGF0ZSwKPiBuZXdfY3J0Y19zdGF0ZSwgaSkgewo+ICsJCQlpZiAoZHJtX2F0b21pY19jcnRj
X25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUpKSB7Cj4gKwkJCQlyZXQgPSBhZGRfYWZmZWN0
ZWRfbXN0X2RzY19jcnRjcyhzdGF0ZSwgY3J0Yyk7Cj4gKwkJCQlpZiAocmV0KQo+ICsJCQkJCWdv
dG8gZmFpbDsKPiArCQkJfQo+ICsJCX0KPiArCX0KPiArI2VuZGlmCj4gIAlmb3JfZWFjaF9vbGRu
ZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsCj4gbmV3X2NydGNf
c3RhdGUsIGkpIHsKPiAgCQlpZiAoIWRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KG5ld19j
cnRjX3N0YXRlKSAmJgo+ICAJCSAgICAhbmV3X2NydGNfc3RhdGUtPmNvbG9yX21nbXRfY2hhbmdl
ZCAmJgotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
