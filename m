Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE79D7EB8
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096E6E88C;
	Tue, 15 Oct 2019 18:17:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220D56E879
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:16:15 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q10so48314575iop.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XcVBi9ccgY4WcIiK7htGW9JC/41ZVBDU/dZyJbvS0oI=;
 b=RyJMpv8EGlkxPUqY44pKmP7rHwoc8/7CZjhYzAiq8W6HL7PEF969UhHDRnU6d9WNtW
 iPfTzXqIU1smf3fqhUodn5Ak3wXzFrO2k0cgXvWMR0+CdSAPGUfEEdSLDUrK7L8Ilxb4
 GOe2rOIQIoPAk5sl7kJbsR4Oo8r8S6BMfHnJ4bK+/tmw9AcrU6UAT3LC3pyQzaIygt9y
 1QB9r9b/XCmWCFTwEpwmU0gWem0PUdPLpD291A35JsBHC7Ys0SREB6YNyvUnXvrhWWEv
 Fy2GvOhQnYTd7pXdRc3xasoC4mGo+Zj/ZLyO9AXpn8piFUe45bwAdIun5KXfbSq8SWFF
 TlVw==
X-Gm-Message-State: APjAAAUmpRcm3C0F8nU0/rsqXtkxLA936MmPnDG7zSFvPFFPijNIOrXp
 D9vzKI9WvOzndYh5/6XYI+SUrg==
X-Google-Smtp-Source: APXvYqyx9iOETMkWQM2sfKJTNRp/60e+N/aCImQtCZIAbTEsdBubG9IKWgw/xkcAPqe/1cFrooZISw==
X-Received: by 2002:a5d:9e02:: with SMTP id h2mr26817595ioh.137.1571163374432; 
 Tue, 15 Oct 2019 11:16:14 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id m11sm14366395ioq.5.2019.10.15.11.16.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:13 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002C1-CW; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH hmm 04/15] mm/hmm: define the pre-processor related parts of
 hmm.h even if disabled
Date: Tue, 15 Oct 2019 15:12:31 -0300
Message-Id: <20191015181242.8343-5-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 18:17:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcVBi9ccgY4WcIiK7htGW9JC/41ZVBDU/dZyJbvS0oI=;
 b=gOR7v+Magpr20tPpBhw3su5vwBWD1crfNwZ0Z9VwQerZXk4VmKtv7ZGa/jZLOy3+Gb
 K/Q7dJA5LKZQavy+GhBoux2L8kxb3css4d9zN/qzJ6D9qjLAybfSGz5wAW9Oa8BkSVtJ
 te/l388bPwiD/m6Mv210cwaQmHe4ZhGHpALba4ndH4+4j9LOZ5xQuVmuzT9Du8DYtThP
 FU5+UPGU4MiMeGISYSD3jjKBdkSmM33uzAoSWwQ4tizM9raO+SKggS9Hv63dzChlpFDC
 P9lGy5CTBdU2CwXQdDQ23RO44PDQ6aNgRYtT68MI+iv+KJ0S/ruk9IdofQwJd83rujzd
 zcxQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKT25seSB0aGUgZnVuY3Rp
b24gY2FsbHMgYXJlIHN0dWJiZWQgb3V0IHdpdGggc3RhdGljIGlubGluZXMgdGhhdCBhbHdheXMK
ZmFpbC4gVGhpcyBpcyB0aGUgc3RhbmRhcmQgd2F5IHRvIHdyaXRlIGEgaGVhZGVyIGZvciBhbiBv
cHRpb25hbCBjb21wb25lbnQKYW5kIG1ha2VzIGl0IGVhc2llciBmb3IgZHJpdmVycyB0aGF0IG9u
bHkgb3B0aW9uYWxseSBuZWVkIEhNTV9NSVJST1IuCgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50
aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9obW0uaCB8IDU5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQoga2VybmVsL2Zvcmsu
YyAgICAgICB8ICAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGlu
dXgvaG1tLmgKaW5kZXggOGFjMWZkNmE4MWFmOGYuLjI2NjZlYjA4YTQwNjE1IDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTYyLDgg
KzYyLDYgQEAKICNpbmNsdWRlIDxsaW51eC9rY29uZmlnLmg+CiAjaW5jbHVkZSA8YXNtL3BndGFi
bGUuaD4KIAotI2lmZGVmIENPTkZJR19ITU1fTUlSUk9SCi0KICNpbmNsdWRlIDxsaW51eC9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9taWdyYXRlLmg+CiAjaW5jbHVkZSA8bGludXgvbWVtcmVt
YXAuaD4KQEAgLTM3NCw2ICszNzIsMTUgQEAgc3RydWN0IGhtbV9taXJyb3IgewogCXN0cnVjdCBs
aXN0X2hlYWQJCWxpc3Q7CiB9OwogCisvKgorICogUmV0cnkgZmF1bHQgaWYgbm9uLWJsb2NraW5n
LCBkcm9wIG1tYXBfc2VtIGFuZCByZXR1cm4gLUVBR0FJTiBpbiB0aGF0IGNhc2UuCisgKi8KKyNk
ZWZpbmUgSE1NX0ZBVUxUX0FMTE9XX1JFVFJZCQkoMSA8PCAwKQorCisvKiBEb24ndCBmYXVsdCBp
biBtaXNzaW5nIFBURXMsIGp1c3Qgc25hcHNob3QgdGhlIGN1cnJlbnQgc3RhdGUuICovCisjZGVm
aW5lIEhNTV9GQVVMVF9TTkFQU0hPVAkJKDEgPDwgMSkKKworI2lmZGVmIENPTkZJR19ITU1fTUlS
Uk9SCiBpbnQgaG1tX21pcnJvcl9yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLCBz
dHJ1Y3QgbW1fc3RydWN0ICptbSk7CiB2b2lkIGhtbV9taXJyb3JfdW5yZWdpc3RlcihzdHJ1Y3Qg
aG1tX21pcnJvciAqbWlycm9yKTsKIApAQCAtMzgzLDE0ICszOTAsNiBAQCB2b2lkIGhtbV9taXJy
b3JfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yKTsKIGludCBobW1fcmFuZ2Vf
cmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHN0cnVjdCBobW1fbWlycm9yICptaXJy
b3IpOwogdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSk7
CiAKLS8qCi0gKiBSZXRyeSBmYXVsdCBpZiBub24tYmxvY2tpbmcsIGRyb3AgbW1hcF9zZW0gYW5k
IHJldHVybiAtRUFHQUlOIGluIHRoYXQgY2FzZS4KLSAqLwotI2RlZmluZSBITU1fRkFVTFRfQUxM
T1dfUkVUUlkJCSgxIDw8IDApCi0KLS8qIERvbid0IGZhdWx0IGluIG1pc3NpbmcgUFRFcywganVz
dCBzbmFwc2hvdCB0aGUgY3VycmVudCBzdGF0ZS4gKi8KLSNkZWZpbmUgSE1NX0ZBVUxUX1NOQVBT
SE9UCQkoMSA8PCAxKQotCiBsb25nIGhtbV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSwgdW5zaWduZWQgaW50IGZsYWdzKTsKIAogbG9uZyBobW1fcmFuZ2VfZG1hX21hcChzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSwKQEAgLTQwMSw2ICs0MDAsNDQgQEAgbG9uZyBobW1fcmFuZ2Vf
ZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCQkJIHN0cnVjdCBkZXZpY2UgKmRl
dmljZSwKIAkJCSBkbWFfYWRkcl90ICpkYWRkcnMsCiAJCQkgYm9vbCBkaXJ0eSk7CisjZWxzZQor
aW50IGhtbV9taXJyb3JfcmVnaXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0
IG1tX3N0cnVjdCAqbW0pCit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCit2b2lkIGhtbV9t
aXJyb3JfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yKQoreworfQorCitpbnQg
aG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCBzdHJ1Y3QgaG1tX21p
cnJvciAqbWlycm9yKQoreworCXJldHVybiAtRU9QTk9UU1VQUDsKK30KKwordm9pZCBobW1fcmFu
Z2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKK3sKK30KKworc3RhdGljIGlu
bGluZSBsb25nIGhtbV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWdu
ZWQgaW50IGZsYWdzKQoreworCXJldHVybiAtRU9QTk9UU1VQUDsKK30KKworc3RhdGljIGlubGlu
ZSBsb25nIGhtbV9yYW5nZV9kbWFfbWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAorCQkJCSAg
ICAgc3RydWN0IGRldmljZSAqZGV2aWNlLCBkbWFfYWRkcl90ICpkYWRkcnMsCisJCQkJICAgICB1
bnNpZ25lZCBpbnQgZmxhZ3MpCit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCitzdGF0aWMg
aW5saW5lIGxvbmcgaG1tX3JhbmdlX2RtYV91bm1hcChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwK
KwkJCQkgICAgICAgc3RydWN0IGRldmljZSAqZGV2aWNlLAorCQkJCSAgICAgICBkbWFfYWRkcl90
ICpkYWRkcnMsIGJvb2wgZGlydHkpCit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorI2VuZGlm
CiAKIC8qCiAgKiBITU1fUkFOR0VfREVGQVVMVF9USU1FT1VUIC0gZGVmYXVsdCB0aW1lb3V0ICht
cykgd2hlbiB3YWl0aW5nIGZvciBhIHJhbmdlCkBAIC00MTEsNiArNDQ4LDQgQEAgbG9uZyBobW1f
cmFuZ2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogICovCiAjZGVmaW5lIEhN
TV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQgMTAwMAogCi0jZW5kaWYgLyogSVNfRU5BQkxFRChDT05G
SUdfSE1NX01JUlJPUikgKi8KLQogI2VuZGlmIC8qIExJTlVYX0hNTV9IICovCmRpZmYgLS1naXQg
YS9rZXJuZWwvZm9yay5jIGIva2VybmVsL2ZvcmsuYwppbmRleCBmOTU3MmY0MTYxMjYyOC4uNDU2
MWE2NWQxOWRiODggMTAwNjQ0Ci0tLSBhL2tlcm5lbC9mb3JrLmMKKysrIGIva2VybmVsL2Zvcmsu
YwpAQCAtNDAsNyArNDAsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2JpbmZtdHMuaD4KICNpbmNsdWRl
IDxsaW51eC9tbWFuLmg+CiAjaW5jbHVkZSA8bGludXgvbW11X25vdGlmaWVyLmg+Ci0jaW5jbHVk
ZSA8bGludXgvaG1tLmg+CiAjaW5jbHVkZSA8bGludXgvZnMuaD4KICNpbmNsdWRlIDxsaW51eC9t
bS5oPgogI2luY2x1ZGUgPGxpbnV4L3ZtYWNhY2hlLmg+Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
