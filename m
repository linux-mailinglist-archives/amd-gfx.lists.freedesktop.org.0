Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE6DFBCC
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 04:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413D46E334;
	Tue, 22 Oct 2019 02:39:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC0B6E33C
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 02:39:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-BIs0Ti7bPwGpe3gSVauWKw-1; Mon, 21 Oct 2019 22:39:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E59B800D41;
 Tue, 22 Oct 2019 02:39:29 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5942C60126;
 Tue, 22 Oct 2019 02:39:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 04/14] drm/dp_mst: Handle UP requests asynchronously
Date: Mon, 21 Oct 2019 22:35:59 -0400
Message-Id: <20191022023641.8026-5-lyude@redhat.com>
In-Reply-To: <20191022023641.8026-1-lyude@redhat.com>
References: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BIs0Ti7bPwGpe3gSVauWKw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571711974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVmsEL0RgTImPJjh23raq9UBGUzn/diPt9aV1LHsdrQ=;
 b=BPa2bTbnmbnyqCiGDptjaYw3Y3OWqHK+AC9ez3m5giuHznw4TSNtJNGLiFqMO2q9aN5mH5
 5wMu7wCYC5VyOFuWbHjbT9xa+n6Rj4yiLYtVJYWvSMDyeMv1Uufuqbflqs+mfoEUJwiqVh
 kGq2IH17EIOhPNlqx2414S1g3zsHwx0=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Harry Wentland <hwentlan@amd.com>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T25jZSB1cG9uIGEgdGltZSwgaG90cGx1Z2dpbmcgZGV2aWNlcyBvbiBNU1QgYnJhbmNoZXMgYWN0
dWFsbHkgd29ya2VkIGluCkRSTS4gTm93LCBpdCBvbmx5IHdvcmtzIGluIGFtZGdwdSAobGlrZWx5
IGJlY2F1c2Ugb2YgaG93IGl0J3MgaG90cGx1ZwpoYW5kbGVycyBhcmUgaW1wbGVtZW50ZWQpLiBP
biBib3RoIGk5MTUgYW5kIG5vdXZlYXUsIGhvdHBsdWcKbm90aWZpY2F0aW9ucyBmcm9tIE1TVCBi
cmFuY2hlcyBhcmUgbm90aWNlZCAtIGJ1dCB0cnlpbmcgdG8gcmVzcG9uZCB0bwp0aGVtIGNhdXNl
cyBtZXNzYWdpbmcgdGltZW91dHMgYW5kIGNhdXNlcyB0aGUgd2hvbGUgdG9wb2xvZ3kgc3RhdGUg
dG8gZ28Kb3V0IG9mIHN5bmMgd2l0aCByZWFsaXR5LCB1c3VhbGx5IHJlc3VsdGluZyBpbiB0aGUg
dXNlciBuZWVkaW5nIHRvCnJlcGx1ZyB0aGUgZW50aXJlIHRvcG9sb2d5IGluIGhvcGVzIHRoYXQg
aXQgYWN0dWFsbHkgZml4ZXMgdGhpbmdzLgoKVGhlIHJlYXNvbiBmb3IgdGhpcyBpcyBiZWNhdXNl
IHRoZSB3YXkgd2UgY3VycmVudGx5IGhhbmRsZSBVUCByZXF1ZXN0cwppbiBNU1QgaXMgY29tcGxl
dGVseSBib2d1cy4gZHJtX2RwX21zdF9oYW5kbGVfdXBfcmVxKCkgaXMgY2FsbGVkIGZyb20KZHJt
X2RwX21zdF9ocGRfaXJxKCksIHdoaWNoIGlzIHVzdWFsbHkgY2FsbGVkIGZyb20gdGhlIGRyaXZl
cidzIGhvdHBsdWcKaGFuZGxlci4gQmVjYXVzZSB3ZSBoYW5kbGUgc2VuZGluZyB0aGUgaG90cGx1
ZyBldmVudCBmcm9tIHRoaXMgZnVuY3Rpb24sCndlIGFjdHVhbGx5IGNhdXNlIHRoZSBkcml2ZXIn
cyBob3RwbHVnIGhhbmRsZXIgKGFuZCBpbiB0dXJuLCBhbGwKc2lkZWJhbmQgdHJhbnNhY3Rpb25z
KSB0byBibG9jayBvbgpkcm1fZGV2aWNlLT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4LiBU
aGlzIG1ha2VzIGl0IGltcG9zc2libGUgdG8Kc2VuZCBhbnkgc2lkZWJhbmQgbWVzc2FnZXMgZnJv
bSB0aGUgZHJpdmVyJ3MgY29ubmVjdG9yIHByb2JpbmcKZnVuY3Rpb25zLCByZXN1bHRpbmcgaW4g
dGhlIGFmb3JlbWVudGlvbmVkIHNpZGViYW5kIG1lc3NhZ2UgdGltZW91dC4KClRoZXJlJ3MgZXZl
biBtb3JlIHByb2JsZW1zIHdpdGggdGhpcyBiZXlvbmQgYnJlYWtpbmcgaG90cGx1Z2dpbmcgb24g
TVNUCmJyYW5jaCBkZXZpY2VzLiBJdCBhbHNvIG1ha2VzIGl0IGFsbW9zdCBpbXBvc3NpYmxlIHRv
IHByb3RlY3QKZHJtX2RwX21zdF9wb3J0IHN0cnVjdCBtZW1iZXJzIHVuZGVyIGEgbG9jayBiZWNh
dXNlIHdlIHRoZW4gaGF2ZSB0bwp3b3JyeSBhYm91dCBkZWFsaW5nIHdpdGggYWxsIG9mIHRoZSBs
b2NrIGRlcGVuZGVuY3kgaXNzdWVzIHRoYXQgZW5zdWUuCgpTbywgbGV0J3MgZmluYWxseSBhY3R1
YWxseSBmaXggdGhpcyBpc3N1ZSBieSBoYW5kbGluZyB0aGUgcHJvY2Vzc2luZyBvZgp1cCByZXF1
ZXN0cyBhc3luY3Jvbm91c2x5LiBUaGlzIHdheSB3ZSBjYW4gc2VuZCBzaWRlYmFuZCBtZXNzYWdl
cyBmcm9tCm1vc3QgY29udGV4dHMgd2l0aG91dCBoYXZpbmcgdG8gZGVhbCB3aXRoIGdldHRpbmcg
YmxvY2tlZCBpZiB3ZSBob2xkCmNvbm5lY3Rpb25fbXV0ZXguIFRoaXMgYWxzbyBmaXhlcyBNU1Qg
YnJhbmNoIGRldmljZSBob3RwbHVnZ2luZyBvbiBpOTE1LApmaW5hbGx5IQoKQ2M6IEp1c3RvbiBM
aSA8anVzdG9uLmxpQGludGVsLmNvbT4KQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNv
bT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNj
OiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJl
ZGhhdC5jb20+ClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMTQ2ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgIHwgIDE2
ICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggM2YxNmMwY2IwOTRiLi4w
OGMzMTZhNzI3ZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAtNDUs
NiArNDUsMTIgQEAKICAqIHByb3RvY29sLiBUaGUgaGVscGVycyBjb250YWluIGEgdG9wb2xvZ3kg
bWFuYWdlciBhbmQgYmFuZHdpZHRoIG1hbmFnZXIuCiAgKiBUaGUgaGVscGVycyBlbmNhcHN1bGF0
ZSB0aGUgc2VuZGluZyBhbmQgcmVjZWl2ZWQgb2Ygc2lkZWJhbmQgbXNncy4KICAqLworc3RydWN0
IGRybV9kcF9wZW5kaW5nX3VwX3JlcSB7CisJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfaGRy
IGhkcjsKKwlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSBtc2c7CisJc3RydWN0
IGxpc3RfaGVhZCBuZXh0OworfTsKKwogc3RhdGljIGJvb2wgZHVtcF9kcF9wYXlsb2FkX3RhYmxl
KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJCSAgY2hhciAqYnVmKTsK
IApAQCAtMzA5MSw2ICszMDk3LDcgQEAgdm9pZCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zdXNw
ZW5kKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQogCWRybV9kcF9kcGNkX3dy
aXRlYihtZ3ItPmF1eCwgRFBfTVNUTV9DVFJMLAogCQkJICAgRFBfTVNUX0VOIHwgRFBfVVBTVFJF
QU1fSVNfU1JDKTsKIAltdXRleF91bmxvY2soJm1nci0+bG9jayk7CisJZmx1c2hfd29yaygmbWdy
LT51cF9yZXFfd29yayk7CiAJZmx1c2hfd29yaygmbWdyLT53b3JrKTsKIAlmbHVzaF93b3JrKCZt
Z3ItPmRlbGF5ZWRfZGVzdHJveV93b3JrKTsKIH0KQEAgLTMyNjMsMTIgKzMyNzAsNzAgQEAgc3Rh
dGljIGludCBkcm1fZHBfbXN0X2hhbmRsZV9kb3duX3JlcChzdHJ1Y3QgZHJtX2RwX21zdF90b3Bv
bG9neV9tZ3IgKm1ncikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkCitkcm1f
ZHBfbXN0X3Byb2Nlc3NfdXBfcmVxKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdy
LAorCQkJICBzdHJ1Y3QgZHJtX2RwX3BlbmRpbmdfdXBfcmVxICp1cF9yZXEpCit7CisJc3RydWN0
IGRybV9kcF9tc3RfYnJhbmNoICptc3RiID0gTlVMTDsKKwlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5k
X21zZ19yZXFfYm9keSAqbXNnID0gJnVwX3JlcS0+bXNnOworCXN0cnVjdCBkcm1fZHBfc2lkZWJh
bmRfbXNnX2hkciAqaGRyID0gJnVwX3JlcS0+aGRyOworCisJaWYgKGhkci0+YnJvYWRjYXN0KSB7
CisJCWNvbnN0IHU4ICpndWlkID0gTlVMTDsKKworCQlpZiAobXNnLT5yZXFfdHlwZSA9PSBEUF9D
T05ORUNUSU9OX1NUQVRVU19OT1RJRlkpCisJCQlndWlkID0gbXNnLT51LmNvbm5fc3RhdC5ndWlk
OworCQllbHNlIGlmIChtc2ctPnJlcV90eXBlID09IERQX1JFU09VUkNFX1NUQVRVU19OT1RJRlkp
CisJCQlndWlkID0gbXNnLT51LnJlc291cmNlX3N0YXQuZ3VpZDsKKworCQltc3RiID0gZHJtX2Rw
X2dldF9tc3RfYnJhbmNoX2RldmljZV9ieV9ndWlkKG1nciwgZ3VpZCk7CisJfSBlbHNlIHsKKwkJ
bXN0YiA9IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2UobWdyLCBoZHItPmxjdCwgaGRyLT5y
YWQpOworCX0KKworCWlmICghbXN0YikgeworCQlEUk1fREVCVUdfS01TKCJHb3QgTVNUIHJlcGx5
IGZyb20gdW5rbm93biBkZXZpY2UgJWRcbiIsCisJCQkgICAgICBoZHItPmxjdCk7CisJCXJldHVy
bjsKKwl9CisKKwkvKiBUT0RPOiBBZGQgbWlzc2luZyBoYW5kbGVyIGZvciBEUF9SRVNPVVJDRV9T
VEFUVVNfTk9USUZZIGV2ZW50cyAqLworCWlmIChtc2ctPnJlcV90eXBlID09IERQX0NPTk5FQ1RJ
T05fU1RBVFVTX05PVElGWSkgeworCQlkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQobXN0Yiwg
Jm1zZy0+dS5jb25uX3N0YXQpOworCQlkcm1fa21zX2hlbHBlcl9ob3RwbHVnX2V2ZW50KG1nci0+
ZGV2KTsKKwl9CisKKwlkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9tc3RiKG1zdGIpOworfQorCitz
dGF0aWMgdm9pZCBkcm1fZHBfbXN0X3VwX3JlcV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykKK3sKKwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciA9CisJCWNvbnRhaW5l
cl9vZih3b3JrLCBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IsCisJCQkgICAgIHVwX3Jl
cV93b3JrKTsKKwlzdHJ1Y3QgZHJtX2RwX3BlbmRpbmdfdXBfcmVxICp1cF9yZXE7CisKKwl3aGls
ZSAodHJ1ZSkgeworCQltdXRleF9sb2NrKCZtZ3ItPnVwX3JlcV9sb2NrKTsKKwkJdXBfcmVxID0g
bGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZtZ3ItPnVwX3JlcV9saXN0LAorCQkJCQkJICBzdHJ1
Y3QgZHJtX2RwX3BlbmRpbmdfdXBfcmVxLAorCQkJCQkJICBuZXh0KTsKKwkJaWYgKHVwX3JlcSkK
KwkJCWxpc3RfZGVsKCZ1cF9yZXEtPm5leHQpOworCQltdXRleF91bmxvY2soJm1nci0+dXBfcmVx
X2xvY2spOworCisJCWlmICghdXBfcmVxKQorCQkJYnJlYWs7CisKKwkJZHJtX2RwX21zdF9wcm9j
ZXNzX3VwX3JlcShtZ3IsIHVwX3JlcSk7CisJCWtmcmVlKHVwX3JlcSk7CisJfQorfQorCiBzdGF0
aWMgaW50IGRybV9kcF9tc3RfaGFuZGxlX3VwX3JlcShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1ncikKIHsKLQlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSBtc2c7
CiAJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfaGRyICpoZHIgPSAmbWdyLT51cF9yZXFfcmVj
di5pbml0aWFsX2hkcjsKLQlzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIgPSBOVUxMOwot
CWNvbnN0IHU4ICpndWlkOworCXN0cnVjdCBkcm1fZHBfcGVuZGluZ191cF9yZXEgKnVwX3JlcTsK
IAlib29sIHNlcW5vOwogCiAJaWYgKCFkcm1fZHBfZ2V0X29uZV9zYl9tc2cobWdyLCB0cnVlKSkK
QEAgLTMyNzcsNTYgKzMzNDIsNTMgQEAgc3RhdGljIGludCBkcm1fZHBfbXN0X2hhbmRsZV91cF9y
ZXEoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpCiAJaWYgKCFtZ3ItPnVwX3Jl
cV9yZWN2LmhhdmVfZW9tdCkKIAkJcmV0dXJuIDA7CiAKLQlpZiAoIWhkci0+YnJvYWRjYXN0KSB7
Ci0JCW1zdGIgPSBkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2aWNlKG1nciwgaGRyLT5sY3QsIGhk
ci0+cmFkKTsKLQkJaWYgKCFtc3RiKSB7Ci0JCQlEUk1fREVCVUdfS01TKCJHb3QgTVNUIHJlcGx5
IGZyb20gdW5rbm93biBkZXZpY2UgJWRcbiIsCi0JCQkJICAgICAgaGRyLT5sY3QpOwotCQkJZ290
byBvdXQ7Ci0JCX0KKwl1cF9yZXEgPSBremFsbG9jKHNpemVvZigqdXBfcmVxKSwgR0ZQX0tFUk5F
TCk7CisJaWYgKCF1cF9yZXEpIHsKKwkJRFJNX0VSUk9SKCJOb3QgZW5vdWdoIG1lbW9yeSB0byBw
cm9jZXNzIE1TVCB1cCByZXFcbiIpOworCQlyZXR1cm4gLUVOT01FTTsKIAl9CisJSU5JVF9MSVNU
X0hFQUQoJnVwX3JlcS0+bmV4dCk7CiAKIAlzZXFubyA9IGhkci0+c2Vxbm87Ci0JZHJtX2RwX3Np
ZGViYW5kX3BhcnNlX3JlcSgmbWdyLT51cF9yZXFfcmVjdiwgJm1zZyk7CisJZHJtX2RwX3NpZGVi
YW5kX3BhcnNlX3JlcSgmbWdyLT51cF9yZXFfcmVjdiwgJnVwX3JlcS0+bXNnKTsKIAotCWlmICht
c2cucmVxX3R5cGUgPT0gRFBfQ09OTkVDVElPTl9TVEFUVVNfTk9USUZZKQotCQlndWlkID0gbXNn
LnUuY29ubl9zdGF0Lmd1aWQ7Ci0JZWxzZSBpZiAobXNnLnJlcV90eXBlID09IERQX1JFU09VUkNF
X1NUQVRVU19OT1RJRlkpCi0JCWd1aWQgPSBtc2cudS5yZXNvdXJjZV9zdGF0Lmd1aWQ7Ci0JZWxz
ZQorCWlmICh1cF9yZXEtPm1zZy5yZXFfdHlwZSAhPSBEUF9DT05ORUNUSU9OX1NUQVRVU19OT1RJ
RlkgJiYKKwkgICAgdXBfcmVxLT5tc2cucmVxX3R5cGUgIT0gRFBfUkVTT1VSQ0VfU1RBVFVTX05P
VElGWSkgeworCQlEUk1fREVCVUdfS01TKCJSZWNlaXZlZCB1bmtub3duIHVwIHJlcSB0eXBlLCBp
Z25vcmluZzogJXhcbiIsCisJCQkgICAgICB1cF9yZXEtPm1zZy5yZXFfdHlwZSk7CisJCWtmcmVl
KHVwX3JlcSk7CiAJCWdvdG8gb3V0OwotCi0JZHJtX2RwX3NlbmRfdXBfYWNrX3JlcGx5KG1nciwg
bWdyLT5tc3RfcHJpbWFyeSwgbXNnLnJlcV90eXBlLCBzZXFubywKLQkJCQkgZmFsc2UpOwotCi0J
aWYgKCFtc3RiKSB7Ci0JCW1zdGIgPSBkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2aWNlX2J5X2d1
aWQobWdyLCBndWlkKTsKLQkJaWYgKCFtc3RiKSB7Ci0JCQlEUk1fREVCVUdfS01TKCJHb3QgTVNU
IHJlcGx5IGZyb20gdW5rbm93biBkZXZpY2UgJWRcbiIsCi0JCQkJICAgICAgaGRyLT5sY3QpOwot
CQkJZ290byBvdXQ7Ci0JCX0KIAl9CiAKLQlpZiAobXNnLnJlcV90eXBlID09IERQX0NPTk5FQ1RJ
T05fU1RBVFVTX05PVElGWSkgewotCQlkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQobXN0Yiwg
Jm1zZy51LmNvbm5fc3RhdCk7CisJZHJtX2RwX3NlbmRfdXBfYWNrX3JlcGx5KG1nciwgbWdyLT5t
c3RfcHJpbWFyeSwgdXBfcmVxLT5tc2cucmVxX3R5cGUsCisJCQkJIHNlcW5vLCBmYWxzZSk7CisK
KwlpZiAodXBfcmVxLT5tc2cucmVxX3R5cGUgPT0gRFBfQ09OTkVDVElPTl9TVEFUVVNfTk9USUZZ
KSB7CisJCWNvbnN0IHN0cnVjdCBkcm1fZHBfY29ubmVjdGlvbl9zdGF0dXNfbm90aWZ5ICpjb25u
X3N0YXQgPQorCQkJJnVwX3JlcS0+bXNnLnUuY29ubl9zdGF0OwogCiAJCURSTV9ERUJVR19LTVMo
IkdvdCBDU046IHBuOiAlZCBsZHBzOiVkIGRkcHM6ICVkIG1jczogJWQgaXA6ICVkIHBkdDogJWRc
biIsCi0JCQkgICAgICBtc2cudS5jb25uX3N0YXQucG9ydF9udW1iZXIsCi0JCQkgICAgICBtc2cu
dS5jb25uX3N0YXQubGVnYWN5X2RldmljZV9wbHVnX3N0YXR1cywKLQkJCSAgICAgIG1zZy51LmNv
bm5fc3RhdC5kaXNwbGF5cG9ydF9kZXZpY2VfcGx1Z19zdGF0dXMsCi0JCQkgICAgICBtc2cudS5j
b25uX3N0YXQubWVzc2FnZV9jYXBhYmlsaXR5X3N0YXR1cywKLQkJCSAgICAgIG1zZy51LmNvbm5f
c3RhdC5pbnB1dF9wb3J0LAotCQkJICAgICAgbXNnLnUuY29ubl9zdGF0LnBlZXJfZGV2aWNlX3R5
cGUpOworCQkJICAgICAgY29ubl9zdGF0LT5wb3J0X251bWJlciwKKwkJCSAgICAgIGNvbm5fc3Rh
dC0+bGVnYWN5X2RldmljZV9wbHVnX3N0YXR1cywKKwkJCSAgICAgIGNvbm5fc3RhdC0+ZGlzcGxh
eXBvcnRfZGV2aWNlX3BsdWdfc3RhdHVzLAorCQkJICAgICAgY29ubl9zdGF0LT5tZXNzYWdlX2Nh
cGFiaWxpdHlfc3RhdHVzLAorCQkJICAgICAgY29ubl9zdGF0LT5pbnB1dF9wb3J0LAorCQkJICAg
ICAgY29ubl9zdGF0LT5wZWVyX2RldmljZV90eXBlKTsKKwl9IGVsc2UgaWYgKHVwX3JlcS0+bXNn
LnJlcV90eXBlID09IERQX1JFU09VUkNFX1NUQVRVU19OT1RJRlkpIHsKKwkJY29uc3Qgc3RydWN0
IGRybV9kcF9yZXNvdXJjZV9zdGF0dXNfbm90aWZ5ICpyZXNfc3RhdCA9CisJCQkmdXBfcmVxLT5t
c2cudS5yZXNvdXJjZV9zdGF0OwogCi0JCWRybV9rbXNfaGVscGVyX2hvdHBsdWdfZXZlbnQobWdy
LT5kZXYpOwotCX0gZWxzZSBpZiAobXNnLnJlcV90eXBlID09IERQX1JFU09VUkNFX1NUQVRVU19O
T1RJRlkpIHsKIAkJRFJNX0RFQlVHX0tNUygiR290IFJTTjogcG46ICVkIGF2YWlsX3BibiAlZFxu
IiwKLQkJCSAgICAgIG1zZy51LnJlc291cmNlX3N0YXQucG9ydF9udW1iZXIsCi0JCQkgICAgICBt
c2cudS5yZXNvdXJjZV9zdGF0LmF2YWlsYWJsZV9wYm4pOworCQkJICAgICAgcmVzX3N0YXQtPnBv
cnRfbnVtYmVyLAorCQkJICAgICAgcmVzX3N0YXQtPmF2YWlsYWJsZV9wYm4pOwogCX0KIAotCWRy
bV9kcF9tc3RfdG9wb2xvZ3lfcHV0X21zdGIobXN0Yik7CisJdXBfcmVxLT5oZHIgPSAqaGRyOwor
CW11dGV4X2xvY2soJm1nci0+dXBfcmVxX2xvY2spOworCWxpc3RfYWRkX3RhaWwoJnVwX3JlcS0+
bmV4dCwgJm1nci0+dXBfcmVxX2xpc3QpOworCW11dGV4X3VubG9jaygmbWdyLT51cF9yZXFfbG9j
ayk7CisJcXVldWVfd29yayhzeXN0ZW1fbG9uZ193cSwgJm1nci0+dXBfcmVxX3dvcmspOworCiBv
dXQ6CiAJbWVtc2V0KCZtZ3ItPnVwX3JlcV9yZWN2LCAwLCBzaXplb2Yoc3RydWN0IGRybV9kcF9z
aWRlYmFuZF9tc2dfcngpKTsKIAlyZXR1cm4gMDsKQEAgLTQyODYsMTIgKzQzNDgsMTUgQEAgaW50
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2luaXQoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IsCiAJbXV0ZXhfaW5pdCgmbWdyLT5xbG9jayk7CiAJbXV0ZXhfaW5pdCgmbWdyLT5w
YXlsb2FkX2xvY2spOwogCW11dGV4X2luaXQoJm1nci0+ZGVsYXllZF9kZXN0cm95X2xvY2spOwor
CW11dGV4X2luaXQoJm1nci0+dXBfcmVxX2xvY2spOwogCUlOSVRfTElTVF9IRUFEKCZtZ3ItPnR4
X21zZ19kb3ducSk7CiAJSU5JVF9MSVNUX0hFQUQoJm1nci0+ZGVzdHJveV9wb3J0X2xpc3QpOwog
CUlOSVRfTElTVF9IRUFEKCZtZ3ItPmRlc3Ryb3lfYnJhbmNoX2RldmljZV9saXN0KTsKKwlJTklU
X0xJU1RfSEVBRCgmbWdyLT51cF9yZXFfbGlzdCk7CiAJSU5JVF9XT1JLKCZtZ3ItPndvcmssIGRy
bV9kcF9tc3RfbGlua19wcm9iZV93b3JrKTsKIAlJTklUX1dPUksoJm1nci0+dHhfd29yaywgZHJt
X2RwX3R4X3dvcmspOwogCUlOSVRfV09SSygmbWdyLT5kZWxheWVkX2Rlc3Ryb3lfd29yaywgZHJt
X2RwX2RlbGF5ZWRfZGVzdHJveV93b3JrKTsKKwlJTklUX1dPUksoJm1nci0+dXBfcmVxX3dvcmss
IGRybV9kcF9tc3RfdXBfcmVxX3dvcmspOwogCWluaXRfd2FpdHF1ZXVlX2hlYWQoJm1nci0+dHhf
d2FpdHEpOwogCW1nci0+ZGV2ID0gZGV2OwogCW1nci0+YXV4ID0gYXV4OwpAQCAtNDM0OCw2ICs0
NDEzLDcgQEAgdm9pZCBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9kZXN0cm95KHN0cnVjdCBkcm1f
ZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQogCW11dGV4X2Rlc3Ryb3koJm1nci0+cGF5bG9hZF9s
b2NrKTsKIAltdXRleF9kZXN0cm95KCZtZ3ItPnFsb2NrKTsKIAltdXRleF9kZXN0cm95KCZtZ3It
PmxvY2spOworCW11dGV4X2Rlc3Ryb3koJm1nci0+dXBfcmVxX2xvY2spOwogfQogRVhQT1JUX1NZ
TUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9kZXN0cm95KTsKIApkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVs
cGVyLmgKaW5kZXggOGJhMmEwMTMyNGJiLi43ZDgwYzM4ZWUwMGUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9o
ZWxwZXIuaApAQCAtNTk3LDYgKzU5NywyMiBAQCBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9t
Z3IgewogCSAqIGRldmljZXMsIG5lZWRlZCB0byBhdm9pZCBsb2NraW5nIGludmVyc2lvbi4KIAkg
Ki8KIAlzdHJ1Y3Qgd29ya19zdHJ1Y3QgZGVsYXllZF9kZXN0cm95X3dvcms7CisKKwkvKioKKwkg
KiBAdXBfcmVxX2xpc3Q6IExpc3Qgb2YgcGVuZGluZyB1cCByZXF1ZXN0cyBmcm9tIHRoZSB0b3Bv
bG9neSB0aGF0CisJICogbmVlZCB0byBiZSBwcm9jZXNzZWQsIGluIGNocm9ub2xvZ2ljYWwgb3Jk
ZXIuCisJICovCisJc3RydWN0IGxpc3RfaGVhZCB1cF9yZXFfbGlzdDsKKwkvKioKKwkgKiBAdXBf
cmVxX2xvY2s6IFByb3RlY3RzIEB1cF9yZXFfbGlzdAorCSAqLworCXN0cnVjdCBtdXRleCB1cF9y
ZXFfbG9jazsKKwkvKioKKwkgKiBAdXBfcmVxX3dvcms6IFdvcmsgaXRlbSB0byBwcm9jZXNzIHVw
IHJlcXVlc3RzIHJlY2VpdmVkIGZyb20gdGhlCisJICogdG9wb2xvZ3kuIE5lZWRlZCB0byBhdm9p
ZCBibG9ja2luZyBob3RwbHVnIGhhbmRsaW5nIGFuZCBzaWRlYmFuZAorCSAqIHRyYW5zbWlzc2lv
bnMuCisJICovCisJc3RydWN0IHdvcmtfc3RydWN0IHVwX3JlcV93b3JrOwogfTsKIAogaW50IGRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2luaXQoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
ICptZ3IsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
