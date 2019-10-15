Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66733D7EAF
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96986E87C;
	Tue, 15 Oct 2019 18:17:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469316E880
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:16:31 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id p12so3290974pgn.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f54wq5BOB+L91cuUIb1GfXpGUvNo7lL3IgdsSk0oLWI=;
 b=HyNIWWrvIhkPqo6fv0rk+ZpE17ZlX80OOQtkixhb/szZCo2JO/U4rijwgKV/Ea8Glm
 Ynak9O/2PVvjPt05LnYyly7RfhhOupWAHhcRrlEgvHrgXpRkysY0OmjTHbEP9Th2w900
 oyxiq4jaOH3PPnX41y6fIIaLDrdOBz9q9KSwhATcki7/gcxdkCjGqTBuVgUzj62zJsAO
 YYjxvggU35KiAzOtjvqHESApxElLratmxT++JCoucge6JDHKXSEFmCO8xjQpDr3UUyxd
 j5h26CgsYgM8TUAH4omQCDt/XNRN9HFe+HgiqdAkS7InO8B+uraQDGCVIn/WuxdYFMF5
 AR+Q==
X-Gm-Message-State: APjAAAW8PlRt2rCZQWbbeAMhUuwNCELwVD58zVnjeLI7m3ExLkUC0CDV
 Q7nvaQHdQwPchR08TgthERXijg==
X-Google-Smtp-Source: APXvYqyG6L/qdqRAkrLQy3I9BQutDzJnYYaH7476RyUKD7uXJsePCREM8sHmKQLRNN8ZVSXmVf3E8Q==
X-Received: by 2002:a63:330f:: with SMTP id z15mr37543207pgz.231.1571163390605; 
 Tue, 15 Oct 2019 11:16:30 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id p68sm29521514pfp.9.2019.10.15.11.16.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:30 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002Ck-P2; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH hmm 13/15] drm/amdgpu: Use mmu_range_insert instead of
 hmm_mirror
Date: Tue, 15 Oct 2019 15:12:40 -0300
Message-Id: <20191015181242.8343-14-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 18:17:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f54wq5BOB+L91cuUIb1GfXpGUvNo7lL3IgdsSk0oLWI=;
 b=Vqp7VLmHUakp5/ynSu6a15OjfsmbHbEaJca4OMUkhoMlEFcds8Act4DGyMT6cnwR/U
 qlZqOkXw1x1gq3Y6W7jWw4pgPhCgKL6jDFrYyIzagyhbZ29MbUA7wnX/QRSwUjVvNt9w
 vj1bloqSZuS3cnnHe4Ahs5KZKe2vI4cFsPji3Knw0ACyQrfwMqbJyPQV9tXU0Twte85K
 5fk4bS3c0UU8HYLBPI//qbh1ZIcFLVmvy5Ms1S81gDZKHk5FaOMP2Ob6cuOtPz2OmjNf
 27rG0FGIJHo31dhDj/3JBoYubwGgQE9SrYjk3ru4peY5DCk8J1FQi50LR7k94vsxjkGS
 jI7g==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, David Zhou <David1.Zhou@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKUmVtb3ZlIHRoZSBpbnRl
cnZhbCB0cmVlIGluIHRoZSBkcml2ZXIgYW5kIHJlbHkgb24gdGhlIHRyZWUgbWFpbnRhaW5lZCBi
eQp0aGUgbW11X25vdGlmaWVyIGZvciBkZWxpdmVyaW5nIG1tdV9ub3RpZmllciBpbnZhbGlkYXRp
b24gY2FsbGJhY2tzLgoKRm9yIHNvbWUgcmVhc29uIGFtZGdwdSBoYXMgYSB2ZXJ5IGNvbXBsaWNh
dGVkIGFycmFuZ2VtZW50IHdoZXJlIGl0IHRyaWVzCnRvIHByZXZlbnQgZHVwbGljYXRlIGVudHJp
ZXMgaW4gdGhlIGludGVydmFsX3RyZWUsIHRoaXMgaXMgbm90IG5lY2Vzc2FyeSwKZWFjaCBhbWRn
cHVfYm8gY2FuIGJlIGl0cyBvd24gc3RhbmQgYWxvbmUgZW50cnkuIGludGVydmFsX3RyZWUgYWxy
ZWFkeQphbGxvd3MgZHVwbGljYXRlcyBhbmQgb3ZlcmxhcHMgaW4gdGhlIHRyZWUuCgpBbHNvLCB0
aGVyZSBpcyBubyBuZWVkIHRvIHJlbW92ZSBlbnRyaWVzIHVwb24gYSByZWxlYXNlIGNhbGxiYWNr
LCB0aGUKbW11X3JhbmdlIEFQSSBzYWZlbHkgYWxsb3dzIG9iamVjdHMgdG8gcmVtYWluIHJlZ2lz
dGVyZWQgYmV5b25kIHRoZQpsaWZldGltZSBvZiB0aGUgbW0uIFRoZSBkcml2ZXIgb25seSBoYXMg
dG8gc3RvcCB0b3VjaGluZyB0aGUgcGFnZXMgZHVyaW5nCnJlbGVhc2UuCgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgKENodW5NaW5nKSBaaG91IDxEYXZpZDEu
WmhvdUBhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICB8ICAgMiArCiAuLi4vZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCAgIDUgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfbW4uYyAgICAgICAgfCAzNDEgKysrKy0tLS0tLS0tLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaCAgICAgICAgfCAgIDQgLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oICAgIHwgIDEzICstCiA2IGZp
bGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDI4MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IGJkMzdkZjVkZDZkMDQ4Li42MDU5MWE1ZDQyMDAy
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTEwMDYsNiArMTAwNiw4IEBA
IHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKIAlzdHJ1Y3QgbXV0ZXggIGxvY2tfcmVzZXQ7CiAJc3Ry
dWN0IGFtZGdwdV9kb29yYmVsbF9pbmRleCBkb29yYmVsbF9pbmRleDsKIAorCXN0cnVjdCBtdXRl
eAkJCW5vdGlmaWVyX2xvY2s7CisKIAlpbnQgYXNpY19yZXNldF9yZXM7CiAJc3RydWN0IHdvcmtf
c3RydWN0CQl4Z21pX3Jlc2V0X3dvcms7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwppbmRleCA2ZDAyMWVjYzhkNTk4Zi4uNDc3MDAzMDJh
MDhiN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMKQEAgLTQ4MSw4ICs0ODEsNyBAQCBzdGF0aWMgdm9pZCByZW1vdmVfa2dkX21lbV9m
cm9tX2tmZF9ib19saXN0KHN0cnVjdCBrZ2RfbWVtICptZW0sCiAgKgogICogUmV0dXJucyAwIGZv
ciBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJubyBmb3IgZXJyb3JzLgogICovCi1zdGF0aWMgaW50IGlu
aXRfdXNlcl9wYWdlcyhzdHJ1Y3Qga2dkX21lbSAqbWVtLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwK
LQkJCSAgIHVpbnQ2NF90IHVzZXJfYWRkcikKK3N0YXRpYyBpbnQgaW5pdF91c2VyX3BhZ2VzKHN0
cnVjdCBrZ2RfbWVtICptZW0sIHVpbnQ2NF90IHVzZXJfYWRkcikKIHsKIAlzdHJ1Y3QgYW1ka2Zk
X3Byb2Nlc3NfaW5mbyAqcHJvY2Vzc19pbmZvID0gbWVtLT5wcm9jZXNzX2luZm87CiAJc3RydWN0
IGFtZGdwdV9ibyAqYm8gPSBtZW0tPmJvOwpAQCAtMTE5NSw3ICsxMTk0LDcgQEAgaW50IGFtZGdw
dV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSgKIAlhZGRfa2dkX21lbV90b19rZmRf
Ym9fbGlzdCgqbWVtLCBhdm0tPnByb2Nlc3NfaW5mbywgdXNlcl9hZGRyKTsKIAogCWlmICh1c2Vy
X2FkZHIpIHsKLQkJcmV0ID0gaW5pdF91c2VyX3BhZ2VzKCptZW0sIGN1cnJlbnQtPm1tLCB1c2Vy
X2FkZHIpOworCQlyZXQgPSBpbml0X3VzZXJfcGFnZXMoKm1lbSwgdXNlcl9hZGRyKTsKIAkJaWYg
KHJldCkKIAkJCWdvdG8gYWxsb2NhdGVfaW5pdF91c2VyX3BhZ2VzX2ZhaWxlZDsKIAl9CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNWExOTM5ZGJkNGUz
ZTYuLjM4Zjk3OTk4YWFkZGIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCkBAIC0yNjMzLDYgKzI2MzMsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCW11dGV4X2luaXQoJmFkZXYtPnZpcnQudmZfZXJy
b3JzLmxvY2spOwogCWhhc2hfaW5pdChhZGV2LT5tbl9oYXNoKTsKIAltdXRleF9pbml0KCZhZGV2
LT5sb2NrX3Jlc2V0KTsKKwltdXRleF9pbml0KCZhZGV2LT5ub3RpZmllcl9sb2NrKTsKIAltdXRl
eF9pbml0KCZhZGV2LT52aXJ0LmRwbV9tdXRleCk7CiAJbXV0ZXhfaW5pdCgmYWRldi0+cHNwLm11
dGV4KTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21u
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYwppbmRleCAzMWQ0ZGVi
NWQyOTQ4NC4uNGZmZDdiOTBmNGQ5MDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9tbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9tbi5jCkBAIC01MCw2NiArNTAsNiBAQAogI2luY2x1ZGUgImFtZGdwdS5oIgogI2luY2x1ZGUg
ImFtZGdwdV9hbWRrZmQuaCIKIAotLyoqCi0gKiBzdHJ1Y3QgYW1kZ3B1X21uX25vZGUKLSAqCi0g
KiBAaXQ6IGludGVydmFsIG5vZGUgZGVmaW5pbmcgc3RhcnQtbGFzdCBvZiB0aGUgYWZmZWN0ZWQg
YWRkcmVzcyByYW5nZQotICogQGJvczogbGlzdCBvZiBhbGwgQk9zIGluIHRoZSBhZmZlY3RlZCBh
ZGRyZXNzIHJhbmdlCi0gKgotICogTWFuYWdlcyBhbGwgQk9zIHdoaWNoIGFyZSBhZmZlY3RlZCBv
ZiBhIGNlcnRhaW4gcmFuZ2Ugb2YgYWRkcmVzcyBzcGFjZS4KLSAqLwotc3RydWN0IGFtZGdwdV9t
bl9ub2RlIHsKLQlzdHJ1Y3QgaW50ZXJ2YWxfdHJlZV9ub2RlCWl0OwotCXN0cnVjdCBsaXN0X2hl
YWQJCWJvczsKLX07Ci0KLS8qKgotICogYW1kZ3B1X21uX2Rlc3Ryb3kgLSBkZXN0cm95IHRoZSBI
TU0gbWlycm9yCi0gKgotICogQHdvcms6IHByZXZpb3VzbHkgc2hlZHVsZWQgd29yayBpdGVtCi0g
KgotICogTGF6eSBkZXN0cm95cyB0aGUgbm90aWZpZXIgZnJvbSBhIHdvcmsgaXRlbQotICovCi1z
dGF0aWMgdm9pZCBhbWRncHVfbW5fZGVzdHJveShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCi17
Ci0Jc3RydWN0IGFtZGdwdV9tbiAqYW1uID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBhbWRn
cHVfbW4sIHdvcmspOwotCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1uLT5hZGV2Owot
CXN0cnVjdCBhbWRncHVfbW5fbm9kZSAqbm9kZSwgKm5leHRfbm9kZTsKLQlzdHJ1Y3QgYW1kZ3B1
X2JvICpibywgKm5leHRfYm87Ci0KLQltdXRleF9sb2NrKCZhZGV2LT5tbl9sb2NrKTsKLQlkb3du
X3dyaXRlKCZhbW4tPmxvY2spOwotCWhhc2hfZGVsKCZhbW4tPm5vZGUpOwotCXJidHJlZV9wb3N0
b3JkZXJfZm9yX2VhY2hfZW50cnlfc2FmZShub2RlLCBuZXh0X25vZGUsCi0JCQkJCSAgICAgJmFt
bi0+b2JqZWN0cy5yYl9yb290LCBpdC5yYikgewotCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
Ym8sIG5leHRfYm8sICZub2RlLT5ib3MsIG1uX2xpc3QpIHsKLQkJCWJvLT5tbiA9IE5VTEw7Ci0J
CQlsaXN0X2RlbF9pbml0KCZiby0+bW5fbGlzdCk7Ci0JCX0KLQkJa2ZyZWUobm9kZSk7Ci0JfQot
CXVwX3dyaXRlKCZhbW4tPmxvY2spOwotCW11dGV4X3VubG9jaygmYWRldi0+bW5fbG9jayk7Ci0K
LQlobW1fbWlycm9yX3VucmVnaXN0ZXIoJmFtbi0+bWlycm9yKTsKLQlrZnJlZShhbW4pOwotfQot
Ci0vKioKLSAqIGFtZGdwdV9obW1fbWlycm9yX3JlbGVhc2UgLSBjYWxsYmFjayB0byBub3RpZnkg
YWJvdXQgbW0gZGVzdHJ1Y3Rpb24KLSAqCi0gKiBAbWlycm9yOiB0aGUgSE1NIG1pcnJvciAobW0p
IHRoaXMgY2FsbGJhY2sgaXMgYWJvdXQKLSAqCi0gKiBTaGVkdWxlIGEgd29yayBpdGVtIHRvIGxh
enkgZGVzdHJveSBITU0gbWlycm9yLgotICovCi1zdGF0aWMgdm9pZCBhbWRncHVfaG1tX21pcnJv
cl9yZWxlYXNlKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpCi17Ci0Jc3RydWN0IGFtZGdwdV9t
biAqYW1uID0gY29udGFpbmVyX29mKG1pcnJvciwgc3RydWN0IGFtZGdwdV9tbiwgbWlycm9yKTsK
LQotCUlOSVRfV09SSygmYW1uLT53b3JrLCBhbWRncHVfbW5fZGVzdHJveSk7Ci0Jc2NoZWR1bGVf
d29yaygmYW1uLT53b3JrKTsKLX0KLQogLyoqCiAgKiBhbWRncHVfbW5fbG9jayAtIHRha2UgdGhl
IHdyaXRlIHNpZGUgbG9jayBmb3IgdGhpcyBub3RpZmllcgogICoKQEAgLTEzMywxNTcgKzczLDg2
IEBAIHZvaWQgYW1kZ3B1X21uX3VubG9jayhzdHJ1Y3QgYW1kZ3B1X21uICptbikKIH0KIAogLyoq
Ci0gKiBhbWRncHVfbW5fcmVhZF9sb2NrIC0gdGFrZSB0aGUgcmVhZCBzaWRlIGxvY2sgZm9yIHRo
aXMgbm90aWZpZXIKLSAqCi0gKiBAYW1uOiBvdXIgbm90aWZpZXIKLSAqLwotc3RhdGljIGludCBh
bWRncHVfbW5fcmVhZF9sb2NrKHN0cnVjdCBhbWRncHVfbW4gKmFtbiwgYm9vbCBibG9ja2FibGUp
Ci17Ci0JaWYgKGJsb2NrYWJsZSkKLQkJZG93bl9yZWFkKCZhbW4tPmxvY2spOwotCWVsc2UgaWYg
KCFkb3duX3JlYWRfdHJ5bG9jaygmYW1uLT5sb2NrKSkKLQkJcmV0dXJuIC1FQUdBSU47Ci0KLQly
ZXR1cm4gMDsKLX0KLQotLyoqCi0gKiBhbWRncHVfbW5fcmVhZF91bmxvY2sgLSBkcm9wIHRoZSBy
ZWFkIHNpZGUgbG9jayBmb3IgdGhpcyBub3RpZmllcgotICoKLSAqIEBhbW46IG91ciBub3RpZmll
cgotICovCi1zdGF0aWMgdm9pZCBhbWRncHVfbW5fcmVhZF91bmxvY2soc3RydWN0IGFtZGdwdV9t
biAqYW1uKQotewotCXVwX3JlYWQoJmFtbi0+bG9jayk7Ci19Ci0KLS8qKgotICogYW1kZ3B1X21u
X2ludmFsaWRhdGVfbm9kZSAtIHVubWFwIGFsbCBCT3Mgb2YgYSBub2RlCisgKiBhbWRncHVfbW5f
aW52YWxpZGF0ZV9nZnggLSBjYWxsYmFjayB0byBub3RpZnkgYWJvdXQgbW0gY2hhbmdlCiAgKgot
ICogQG5vZGU6IHRoZSBub2RlIHdpdGggdGhlIEJPcyB0byB1bm1hcAotICogQHN0YXJ0OiBzdGFy
dCBvZiBhZGRyZXNzIHJhbmdlIGFmZmVjdGVkCi0gKiBAZW5kOiBlbmQgb2YgYWRkcmVzcyByYW5n
ZSBhZmZlY3RlZAorICogQG1ybjogdGhlIHJhbmdlIChtbSkgaXMgYWJvdXQgdG8gdXBkYXRlCisg
KiBAcmFuZ2U6IGRldGFpbHMgb24gdGhlIGludmFsaWRhdGlvbgogICoKICAqIEJsb2NrIGZvciBv
cGVyYXRpb25zIG9uIEJPcyB0byBmaW5pc2ggYW5kIG1hcmsgcGFnZXMgYXMgYWNjZXNzZWQgYW5k
CiAgKiBwb3RlbnRpYWxseSBkaXJ0eS4KICAqLwotc3RhdGljIHZvaWQgYW1kZ3B1X21uX2ludmFs
aWRhdGVfbm9kZShzdHJ1Y3QgYW1kZ3B1X21uX25vZGUgKm5vZGUsCi0JCQkJICAgICAgdW5zaWdu
ZWQgbG9uZyBzdGFydCwKLQkJCQkgICAgICB1bnNpZ25lZCBsb25nIGVuZCkKK3N0YXRpYyBib29s
IGFtZGdwdV9tbl9pbnZhbGlkYXRlX2dmeChzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICptcm4s
CisJCQkJICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKIHsKLQlz
dHJ1Y3QgYW1kZ3B1X2JvICpibzsKKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IGNvbnRhaW5lcl9v
Zihtcm4sIHN0cnVjdCBhbWRncHVfYm8sIG5vdGlmaWVyKTsKKwlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwogCWxvbmcgcjsKIAotCWxp
c3RfZm9yX2VhY2hfZW50cnkoYm8sICZub2RlLT5ib3MsIG1uX2xpc3QpIHsKLQotCQlpZiAoIWFt
ZGdwdV90dG1fdHRfYWZmZWN0X3VzZXJwdHIoYm8tPnRiby50dG0sIHN0YXJ0LCBlbmQpKQotCQkJ
Y29udGludWU7Ci0KLQkJciA9IGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3UoYm8tPnRiby5iYXNl
LnJlc3YsCi0JCQl0cnVlLCBmYWxzZSwgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOwotCQlpZiAociA8
PSAwKQotCQkJRFJNX0VSUk9SKCIoJWxkKSBmYWlsZWQgdG8gd2FpdCBmb3IgdXNlciBib1xuIiwg
cik7Ci0JfQorCS8qIEZJWE1FOiBJcyB0aGlzIG5lY2Vzc2FyeT8gKi8KKwlpZiAoIWFtZGdwdV90
dG1fdHRfYWZmZWN0X3VzZXJwdHIoYm8tPnRiby50dG0sIHJhbmdlLT5zdGFydCwKKwkJCQkJICBy
YW5nZS0+ZW5kKSkKKwkJcmV0dXJuIHRydWU7CisKKwlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9i
bG9ja2FibGUocmFuZ2UpKQorCQlyZXR1cm4gZmFsc2U7CisKKwltdXRleF9sb2NrKCZhZGV2LT5u
b3RpZmllcl9sb2NrKTsKKwlyID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShiby0+dGJvLmJh
c2UucmVzdiwgdHJ1ZSwgZmFsc2UsCisJCQkJICAgICAgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOwor
CW11dGV4X3VubG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7CisJaWYgKHIgPD0gMCkKKwkJRFJN
X0VSUk9SKCIoJWxkKSBmYWlsZWQgdG8gd2FpdCBmb3IgdXNlciBib1xuIiwgcik7CisJcmV0dXJu
IHRydWU7CiB9CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyX29wcyBh
bWRncHVfbW5fZ2Z4X29wcyA9IHsKKwkuaW52YWxpZGF0ZSA9IGFtZGdwdV9tbl9pbnZhbGlkYXRl
X2dmeCwKK307CisKIC8qKgotICogYW1kZ3B1X21uX3N5bmNfcGFnZXRhYmxlc19nZnggLSBjYWxs
YmFjayB0byBub3RpZnkgYWJvdXQgbW0gY2hhbmdlCisgKiBhbWRncHVfbW5faW52YWxpZGF0ZV9o
c2EgLSBjYWxsYmFjayB0byBub3RpZnkgYWJvdXQgbW0gY2hhbmdlCiAgKgotICogQG1pcnJvcjog
dGhlIGhtbV9taXJyb3IgKG1tKSBpcyBhYm91dCB0byB1cGRhdGUKLSAqIEB1cGRhdGU6IHRoZSB1
cGRhdGUgc3RhcnQsIGVuZCBhZGRyZXNzCisgKiBAbXJuOiB0aGUgcmFuZ2UgKG1tKSBpcyBhYm91
dCB0byB1cGRhdGUKKyAqIEByYW5nZTogZGV0YWlscyBvbiB0aGUgaW52YWxpZGF0aW9uCiAgKgot
ICogQmxvY2sgZm9yIG9wZXJhdGlvbnMgb24gQk9zIHRvIGZpbmlzaCBhbmQgbWFyayBwYWdlcyBh
cyBhY2Nlc3NlZCBhbmQKLSAqIHBvdGVudGlhbGx5IGRpcnR5LgorICogV2UgdGVtcG9yYXJpbHkg
ZXZpY3QgdGhlIEJPIGF0dGFjaGVkIHRvIHRoaXMgcmFuZ2UuIFRoaXMgbmVjZXNzaXRhdGVzCisg
KiBldmljdGluZyBhbGwgdXNlci1tb2RlIHF1ZXVlcyBvZiB0aGUgcHJvY2Vzcy4KICAqLwotc3Rh
dGljIGludAotYW1kZ3B1X21uX3N5bmNfcGFnZXRhYmxlc19nZngoc3RydWN0IGhtbV9taXJyb3Ig
Km1pcnJvciwKLQkJCSAgICAgIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnVwZGF0
ZSkKK3N0YXRpYyBib29sIGFtZGdwdV9tbl9pbnZhbGlkYXRlX2hzYShzdHJ1Y3QgbW11X3Jhbmdl
X25vdGlmaWVyICptcm4sCisJCQkJICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3Jhbmdl
ICpyYW5nZSkKIHsKLQlzdHJ1Y3QgYW1kZ3B1X21uICphbW4gPSBjb250YWluZXJfb2YobWlycm9y
LCBzdHJ1Y3QgYW1kZ3B1X21uLCBtaXJyb3IpOwotCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSB1cGRh
dGUtPnN0YXJ0OwotCXVuc2lnbmVkIGxvbmcgZW5kID0gdXBkYXRlLT5lbmQ7Ci0JYm9vbCBibG9j
a2FibGUgPSBtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHVwZGF0ZSk7Ci0Jc3RydWN0IGlu
dGVydmFsX3RyZWVfbm9kZSAqaXQ7Ci0KLQkvKiBub3RpZmljYXRpb24gaXMgZXhjbHVzaXZlLCBi
dXQgaW50ZXJ2YWwgaXMgaW5jbHVzaXZlICovCi0JZW5kIC09IDE7Ci0KLQkvKiBUT0RPIHdlIHNo
b3VsZCBiZSBhYmxlIHRvIHNwbGl0IGxvY2tpbmcgZm9yIGludGVydmFsIHRyZWUgYW5kCi0JICog
YW1kZ3B1X21uX2ludmFsaWRhdGVfbm9kZQotCSAqLwotCWlmIChhbWRncHVfbW5fcmVhZF9sb2Nr
KGFtbiwgYmxvY2thYmxlKSkKLQkJcmV0dXJuIC1FQUdBSU47Ci0KLQlpdCA9IGludGVydmFsX3Ry
ZWVfaXRlcl9maXJzdCgmYW1uLT5vYmplY3RzLCBzdGFydCwgZW5kKTsKLQl3aGlsZSAoaXQpIHsK
LQkJc3RydWN0IGFtZGdwdV9tbl9ub2RlICpub2RlOwotCi0JCWlmICghYmxvY2thYmxlKSB7Ci0J
CQlhbWRncHVfbW5fcmVhZF91bmxvY2soYW1uKTsKLQkJCXJldHVybiAtRUFHQUlOOwotCQl9CisJ
c3RydWN0IGFtZGdwdV9ibyAqYm8gPSBjb250YWluZXJfb2YobXJuLCBzdHJ1Y3QgYW1kZ3B1X2Jv
LCBub3RpZmllcik7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2Fk
ZXYoYm8tPnRiby5iZGV2KTsKIAotCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgYW1k
Z3B1X21uX25vZGUsIGl0KTsKLQkJaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfbmV4dChpdCwgc3Rh
cnQsIGVuZCk7CisJLyogRklYTUU6IElzIHRoaXMgbmVjZXNzYXJ5PyAqLworCWlmICghYW1kZ3B1
X3R0bV90dF9hZmZlY3RfdXNlcnB0cihiby0+dGJvLnR0bSwgcmFuZ2UtPnN0YXJ0LAorCQkJCQkg
IHJhbmdlLT5lbmQpKQorCQlyZXR1cm4gdHJ1ZTsKIAotCQlhbWRncHVfbW5faW52YWxpZGF0ZV9u
b2RlKG5vZGUsIHN0YXJ0LCBlbmQpOwotCX0KKwlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9j
a2FibGUocmFuZ2UpKQorCQlyZXR1cm4gZmFsc2U7CiAKLQlhbWRncHVfbW5fcmVhZF91bmxvY2so
YW1uKTsKKwltdXRleF9sb2NrKCZhZGV2LT5ub3RpZmllcl9sb2NrKTsKKwlhbWRncHVfYW1ka2Zk
X2V2aWN0X3VzZXJwdHIoYm8tPmtmZF9ibywgYm8tPm5vdGlmaWVyLm1tKTsKKwltdXRleF91bmxv
Y2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOwogCi0JcmV0dXJuIDA7CisJcmV0dXJuIHRydWU7CiB9
CiAKLS8qKgotICogYW1kZ3B1X21uX3N5bmNfcGFnZXRhYmxlc19oc2EgLSBjYWxsYmFjayB0byBu
b3RpZnkgYWJvdXQgbW0gY2hhbmdlCi0gKgotICogQG1pcnJvcjogdGhlIGhtbV9taXJyb3IgKG1t
KSBpcyBhYm91dCB0byB1cGRhdGUKLSAqIEB1cGRhdGU6IHRoZSB1cGRhdGUgc3RhcnQsIGVuZCBh
ZGRyZXNzCi0gKgotICogV2UgdGVtcG9yYXJpbHkgZXZpY3QgYWxsIEJPcyBiZXR3ZWVuIHN0YXJ0
IGFuZCBlbmQuIFRoaXMKLSAqIG5lY2Vzc2l0YXRlcyBldmljdGluZyBhbGwgdXNlci1tb2RlIHF1
ZXVlcyBvZiB0aGUgcHJvY2Vzcy4gVGhlIEJPcwotICogYXJlIHJlc3RvcnRlZCBpbiBhbWRncHVf
bW5faW52YWxpZGF0ZV9yYW5nZV9lbmRfaHNhLgotICovCi1zdGF0aWMgaW50Ci1hbWRncHVfbW5f
c3luY19wYWdldGFibGVzX2hzYShzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLAotCQkJICAgICAg
Y29uc3Qgc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqdXBkYXRlKQorc3RhdGljIGNvbnN0IHN0
cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXJfb3BzIGFtZGdwdV9tbl9oc2Ffb3BzID0geworCS5pbnZh
bGlkYXRlID0gYW1kZ3B1X21uX2ludmFsaWRhdGVfaHNhLAorfTsKKworc3RhdGljIGludCBhbWRn
cHVfbW5fc3luY19wYWdldGFibGVzKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCisJCQkJICAg
ICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICp1cGRhdGUpCiB7CiAJc3RydWN0IGFt
ZGdwdV9tbiAqYW1uID0gY29udGFpbmVyX29mKG1pcnJvciwgc3RydWN0IGFtZGdwdV9tbiwgbWly
cm9yKTsKLQl1bnNpZ25lZCBsb25nIHN0YXJ0ID0gdXBkYXRlLT5zdGFydDsKLQl1bnNpZ25lZCBs
b25nIGVuZCA9IHVwZGF0ZS0+ZW5kOwotCWJvb2wgYmxvY2thYmxlID0gbW11X25vdGlmaWVyX3Jh
bmdlX2Jsb2NrYWJsZSh1cGRhdGUpOwotCXN0cnVjdCBpbnRlcnZhbF90cmVlX25vZGUgKml0Owog
Ci0JLyogbm90aWZpY2F0aW9uIGlzIGV4Y2x1c2l2ZSwgYnV0IGludGVydmFsIGlzIGluY2x1c2l2
ZSAqLwotCWVuZCAtPSAxOwotCi0JaWYgKGFtZGdwdV9tbl9yZWFkX2xvY2soYW1uLCBibG9ja2Fi
bGUpKQotCQlyZXR1cm4gLUVBR0FJTjsKLQotCWl0ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0
KCZhbW4tPm9iamVjdHMsIHN0YXJ0LCBlbmQpOwotCXdoaWxlIChpdCkgewotCQlzdHJ1Y3QgYW1k
Z3B1X21uX25vZGUgKm5vZGU7Ci0JCXN0cnVjdCBhbWRncHVfYm8gKmJvOwotCi0JCWlmICghYmxv
Y2thYmxlKSB7Ci0JCQlhbWRncHVfbW5fcmVhZF91bmxvY2soYW1uKTsKLQkJCXJldHVybiAtRUFH
QUlOOwotCQl9Ci0KLQkJbm9kZSA9IGNvbnRhaW5lcl9vZihpdCwgc3RydWN0IGFtZGdwdV9tbl9u
b2RlLCBpdCk7Ci0JCWl0ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX25leHQoaXQsIHN0YXJ0LCBlbmQp
OwotCi0JCWxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZub2RlLT5ib3MsIG1uX2xpc3QpIHsKLQkJ
CXN0cnVjdCBrZ2RfbWVtICptZW0gPSBiby0+a2ZkX2JvOwotCi0JCQlpZiAoYW1kZ3B1X3R0bV90
dF9hZmZlY3RfdXNlcnB0cihiby0+dGJvLnR0bSwKLQkJCQkJCQkgc3RhcnQsIGVuZCkpCi0JCQkJ
YW1kZ3B1X2FtZGtmZF9ldmljdF91c2VycHRyKG1lbSwgYW1uLT5tbSk7Ci0JCX0KLQl9Ci0KLQlh
bWRncHVfbW5fcmVhZF91bmxvY2soYW1uKTsKKwlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9j
a2FibGUodXBkYXRlKSkKKwkJcmV0dXJuIGZhbHNlOwogCisJZG93bl9yZWFkKCZhbW4tPmxvY2sp
OworCXVwX3JlYWQoJmFtbi0+bG9jayk7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTI5NSwxMiArMTY0
LDEwIEBAIGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfaHNhKHN0cnVjdCBobW1fbWlycm9yICpt
aXJyb3IsCiAKIHN0YXRpYyBzdHJ1Y3QgaG1tX21pcnJvcl9vcHMgYW1kZ3B1X2htbV9taXJyb3Jf
b3BzW10gPSB7CiAJW0FNREdQVV9NTl9UWVBFX0dGWF0gPSB7Ci0JCS5zeW5jX2NwdV9kZXZpY2Vf
cGFnZXRhYmxlcyA9IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4LAotCQkucmVsZWFzZSA9
IGFtZGdwdV9obW1fbWlycm9yX3JlbGVhc2UKKwkJLnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVz
ID0gYW1kZ3B1X21uX3N5bmNfcGFnZXRhYmxlcywKIAl9LAogCVtBTURHUFVfTU5fVFlQRV9IU0Fd
ID0gewotCQkuc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMgPSBhbWRncHVfbW5fc3luY19wYWdl
dGFibGVzX2hzYSwKLQkJLnJlbGVhc2UgPSBhbWRncHVfaG1tX21pcnJvcl9yZWxlYXNlCisJCS5z
eW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcyA9IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXMsCiAJ
fSwKIH07CiAKQEAgLTMyNyw3ICsxOTQsOCBAQCBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5f
Z2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCX0KIAogCWhhc2hfZm9yX2VhY2hfcG9z
c2libGUoYWRldi0+bW5faGFzaCwgYW1uLCBub2RlLCBrZXkpCi0JCWlmIChBTURHUFVfTU5fS0VZ
KGFtbi0+bW0sIGFtbi0+dHlwZSkgPT0ga2V5KQorCQlpZiAoQU1ER1BVX01OX0tFWShhbW4tPm1p
cnJvci5obW0tPm1tdV9ub3RpZmllci5tbSwKKwkJCQkgIGFtbi0+dHlwZSkgPT0ga2V5KQogCQkJ
Z290byByZWxlYXNlX2xvY2tzOwogCiAJYW1uID0ga3phbGxvYyhzaXplb2YoKmFtbiksIEdGUF9L
RVJORUwpOwpAQCAtMzM3LDEwICsyMDUsOCBAQCBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5f
Z2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCX0KIAogCWFtbi0+YWRldiA9IGFkZXY7
Ci0JYW1uLT5tbSA9IG1tOwogCWluaXRfcndzZW0oJmFtbi0+bG9jayk7CiAJYW1uLT50eXBlID0g
dHlwZTsKLQlhbW4tPm9iamVjdHMgPSBSQl9ST09UX0NBQ0hFRDsKIAogCWFtbi0+bWlycm9yLm9w
cyA9ICZhbWRncHVfaG1tX21pcnJvcl9vcHNbdHlwZV07CiAJciA9IGhtbV9taXJyb3JfcmVnaXN0
ZXIoJmFtbi0+bWlycm9yLCBtbSk7CkBAIC0zNjksMTAwICsyMzUsMzMgQEAgc3RydWN0IGFtZGdw
dV9tbiAqYW1kZ3B1X21uX2dldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqIEBibzog
YW1kZ3B1IGJ1ZmZlciBvYmplY3QKICAqIEBhZGRyOiB1c2VycHRyIGFkZHIgd2Ugc2hvdWxkIG1v
bml0b3IKICAqCi0gKiBSZWdpc3RlcnMgYW4gSE1NIG1pcnJvciBmb3IgdGhlIGdpdmVuIEJPIGF0
IHRoZSBzcGVjaWZpZWQgYWRkcmVzcy4KKyAqIFJlZ2lzdGVycyBhIG1tdV9ub3RpZmllciBmb3Ig
dGhlIGdpdmVuIEJPIGF0IHRoZSBzcGVjaWZpZWQgYWRkcmVzcy4KICAqIFJldHVybnMgMCBvbiBz
dWNjZXNzLCAtRVJSTk8gaWYgYW55dGhpbmcgZ29lcyB3cm9uZy4KICAqLwogaW50IGFtZGdwdV9t
bl9yZWdpc3RlcihzdHJ1Y3QgYW1kZ3B1X2JvICpibywgdW5zaWduZWQgbG9uZyBhZGRyKQogewot
CXVuc2lnbmVkIGxvbmcgZW5kID0gYWRkciArIGFtZGdwdV9ib19zaXplKGJvKSAtIDE7Ci0Jc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsK
LQllbnVtIGFtZGdwdV9tbl90eXBlIHR5cGUgPQotCQliby0+a2ZkX2JvID8gQU1ER1BVX01OX1RZ
UEVfSFNBIDogQU1ER1BVX01OX1RZUEVfR0ZYOwotCXN0cnVjdCBhbWRncHVfbW4gKmFtbjsKLQlz
dHJ1Y3QgYW1kZ3B1X21uX25vZGUgKm5vZGUgPSBOVUxMLCAqbmV3X25vZGU7Ci0Jc3RydWN0IGxp
c3RfaGVhZCBib3M7Ci0Jc3RydWN0IGludGVydmFsX3RyZWVfbm9kZSAqaXQ7Ci0KLQlhbW4gPSBh
bWRncHVfbW5fZ2V0KGFkZXYsIHR5cGUpOwotCWlmIChJU19FUlIoYW1uKSkKLQkJcmV0dXJuIFBU
Ul9FUlIoYW1uKTsKLQotCW5ld19ub2RlID0ga21hbGxvYyhzaXplb2YoKm5ld19ub2RlKSwgR0ZQ
X0tFUk5FTCk7Ci0JaWYgKCFuZXdfbm9kZSkKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQlJTklUX0xJ
U1RfSEVBRCgmYm9zKTsKLQotCWRvd25fd3JpdGUoJmFtbi0+bG9jayk7Ci0KLQl3aGlsZSAoKGl0
ID0gaW50ZXJ2YWxfdHJlZV9pdGVyX2ZpcnN0KCZhbW4tPm9iamVjdHMsIGFkZHIsIGVuZCkpKSB7
Ci0JCWtmcmVlKG5vZGUpOwotCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgYW1kZ3B1
X21uX25vZGUsIGl0KTsKLQkJaW50ZXJ2YWxfdHJlZV9yZW1vdmUoJm5vZGUtPml0LCAmYW1uLT5v
YmplY3RzKTsKLQkJYWRkciA9IG1pbihpdC0+c3RhcnQsIGFkZHIpOwotCQllbmQgPSBtYXgoaXQt
Pmxhc3QsIGVuZCk7Ci0JCWxpc3Rfc3BsaWNlKCZub2RlLT5ib3MsICZib3MpOwotCX0KLQotCWlm
ICghbm9kZSkKLQkJbm9kZSA9IG5ld19ub2RlOworCWlmIChiby0+a2ZkX2JvKQorCQliby0+bm90
aWZpZXIub3BzID0gJmFtZGdwdV9tbl9oc2Ffb3BzOwogCWVsc2UKLQkJa2ZyZWUobmV3X25vZGUp
OwotCi0JYm8tPm1uID0gYW1uOwotCi0Jbm9kZS0+aXQuc3RhcnQgPSBhZGRyOwotCW5vZGUtPml0
Lmxhc3QgPSBlbmQ7Ci0JSU5JVF9MSVNUX0hFQUQoJm5vZGUtPmJvcyk7Ci0JbGlzdF9zcGxpY2Uo
JmJvcywgJm5vZGUtPmJvcyk7Ci0JbGlzdF9hZGQoJmJvLT5tbl9saXN0LCAmbm9kZS0+Ym9zKTsK
KwkJYm8tPm5vdGlmaWVyLm9wcyA9ICZhbWRncHVfbW5fZ2Z4X29wczsKIAotCWludGVydmFsX3Ry
ZWVfaW5zZXJ0KCZub2RlLT5pdCwgJmFtbi0+b2JqZWN0cyk7Ci0KLQl1cF93cml0ZSgmYW1uLT5s
b2NrKTsKLQotCXJldHVybiAwOworCXJldHVybiBtbXVfcmFuZ2Vfbm90aWZpZXJfaW5zZXJ0KCZi
by0+bm90aWZpZXIsIGFkZHIsCisJCQkJCSBhbWRncHVfYm9fc2l6ZShibyksIGN1cnJlbnQtPm1t
KTsKIH0KIAogLyoqCi0gKiBhbWRncHVfbW5fdW5yZWdpc3RlciAtIHVucmVnaXN0ZXIgYSBCTyBm
b3IgSE1NIG1pcnJvciB1cGRhdGVzCisgKiBhbWRncHVfbW5fdW5yZWdpc3RlciAtIHVucmVnaXN0
ZXIgYSBCTyBmb3Igbm90aWZpZXIgdXBkYXRlcwogICoKICAqIEBibzogYW1kZ3B1IGJ1ZmZlciBv
YmplY3QKICAqCi0gKiBSZW1vdmUgYW55IHJlZ2lzdHJhdGlvbiBvZiBITU0gbWlycm9yIHVwZGF0
ZXMgZnJvbSB0aGUgYnVmZmVyIG9iamVjdC4KKyAqIFJlbW92ZSBhbnkgcmVnaXN0cmF0aW9uIG9m
IG1tdSBub3RpZmllciB1cGRhdGVzIGZyb20gdGhlIGJ1ZmZlciBvYmplY3QuCiAgKi8KIHZvaWQg
YW1kZ3B1X21uX3VucmVnaXN0ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8pCiB7Ci0Jc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKLQlzdHJ1
Y3QgYW1kZ3B1X21uICphbW47Ci0Jc3RydWN0IGxpc3RfaGVhZCAqaGVhZDsKLQotCW11dGV4X2xv
Y2soJmFkZXYtPm1uX2xvY2spOwotCi0JYW1uID0gYm8tPm1uOwotCWlmIChhbW4gPT0gTlVMTCkg
ewotCQltdXRleF91bmxvY2soJmFkZXYtPm1uX2xvY2spOworCWlmICghYm8tPm5vdGlmaWVyLm1t
KQogCQlyZXR1cm47Ci0JfQotCi0JZG93bl93cml0ZSgmYW1uLT5sb2NrKTsKLQotCS8qIHNhdmUg
dGhlIG5leHQgbGlzdCBlbnRyeSBmb3IgbGF0ZXIgKi8KLQloZWFkID0gYm8tPm1uX2xpc3QubmV4
dDsKLQotCWJvLT5tbiA9IE5VTEw7Ci0JbGlzdF9kZWxfaW5pdCgmYm8tPm1uX2xpc3QpOwotCi0J
aWYgKGxpc3RfZW1wdHkoaGVhZCkpIHsKLQkJc3RydWN0IGFtZGdwdV9tbl9ub2RlICpub2RlOwot
Ci0JCW5vZGUgPSBjb250YWluZXJfb2YoaGVhZCwgc3RydWN0IGFtZGdwdV9tbl9ub2RlLCBib3Mp
OwotCQlpbnRlcnZhbF90cmVlX3JlbW92ZSgmbm9kZS0+aXQsICZhbW4tPm9iamVjdHMpOwotCQlr
ZnJlZShub2RlKTsKLQl9Ci0KLQl1cF93cml0ZSgmYW1uLT5sb2NrKTsKLQltdXRleF91bmxvY2so
JmFkZXYtPm1uX2xvY2spOworCW1tdV9yYW5nZV9ub3RpZmllcl9yZW1vdmUoJmJvLT5ub3RpZmll
cik7CisJYm8tPm5vdGlmaWVyLm1tID0gTlVMTDsKIH0KIAogLyogZmxhZ3MgdXNlZCBieSBITU0g
aW50ZXJuYWwsIG5vdCByZWxhdGVkIHRvIENQVS9HUFUgUFRFIGZsYWdzICovCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oCmluZGV4IGI4ZWQ2ODk0MzYyNWMyLi5kNzNhYjI5NDdi
MjJiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmgKQEAgLTM5LDEyICsz
OSwxMCBAQCBlbnVtIGFtZGdwdV9tbl90eXBlIHsKICAqIHN0cnVjdCBhbWRncHVfbW4KICAqCiAg
KiBAYWRldjogYW1kZ3B1IGRldmljZSBwb2ludGVyCi0gKiBAbW06IHByb2Nlc3MgYWRkcmVzcyBz
cGFjZQogICogQHR5cGU6IHR5cGUgb2YgTU1VIG5vdGlmaWVyCiAgKiBAd29yazogZGVzdHJ1Y3Rp
b24gd29yayBpdGVtCiAgKiBAbm9kZTogaGFzaCB0YWJsZSBub2RlIHRvIGZpbmQgc3RydWN0dXJl
IGJ5IGFkZXYgYW5kIG1uCiAgKiBAbG9jazogcncgc2VtYXBob3JlIHByb3RlY3RpbmcgdGhlIG5v
dGlmaWVyIG5vZGVzCi0gKiBAb2JqZWN0czogaW50ZXJ2YWwgdHJlZSBjb250YWluaW5nIGFtZGdw
dV9tbl9ub2RlcwogICogQG1pcnJvcjogSE1NIG1pcnJvciBmdW5jdGlvbiBzdXBwb3J0CiAgKgog
ICogRGF0YSBmb3IgZWFjaCBhbWRncHUgZGV2aWNlIGFuZCBwcm9jZXNzIGFkZHJlc3Mgc3BhY2Uu
CkBAIC01Miw3ICs1MCw2IEBAIGVudW0gYW1kZ3B1X21uX3R5cGUgewogc3RydWN0IGFtZGdwdV9t
biB7CiAJLyogY29uc3RhbnQgYWZ0ZXIgaW5pdGlhbGlzYXRpb24gKi8KIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZQkqYWRldjsKLQlzdHJ1Y3QgbW1fc3RydWN0CSptbTsKIAllbnVtIGFtZGdwdV9tbl90
eXBlCXR5cGU7CiAKIAkvKiBvbmx5IHVzZWQgb24gZGVzdHJ1Y3Rpb24gKi8KQEAgLTYzLDcgKzYw
LDYgQEAgc3RydWN0IGFtZGdwdV9tbiB7CiAKIAkvKiBvYmplY3RzIHByb3RlY3RlZCBieSBsb2Nr
ICovCiAJc3RydWN0IHJ3X3NlbWFwaG9yZQlsb2NrOwotCXN0cnVjdCByYl9yb290X2NhY2hlZAlv
YmplY3RzOwogCiAjaWZkZWYgQ09ORklHX0hNTV9NSVJST1IKIAkvKiBITU0gbWlycm9yICovCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKaW5kZXggNjU4ZjRjOTc3
OWI3MDQuLjRiNDRhYjg1MGY5NGMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X29iamVjdC5oCkBAIC0zMCw2ICszMCw5IEBACiAKICNpbmNsdWRlIDxkcm0vYW1kZ3B1X2Ry
bS5oPgogI2luY2x1ZGUgImFtZGdwdS5oIgorI2lmZGVmIENPTkZJR19NTVVfTk9USUZJRVIKKyNp
bmNsdWRlIDxsaW51eC9tbXVfbm90aWZpZXIuaD4KKyNlbmRpZgogCiAjZGVmaW5lIEFNREdQVV9C
T19JTlZBTElEX09GRlNFVAlMT05HX01BWAogI2RlZmluZSBBTURHUFVfQk9fTUFYX1BMQUNFTUVO
VFMJMwpAQCAtMTAwLDEwICsxMDMsMTIgQEAgc3RydWN0IGFtZGdwdV9ibyB7CiAJc3RydWN0IHR0
bV9ib19rbWFwX29iagkJZG1hX2J1Zl92bWFwOwogCXN0cnVjdCBhbWRncHVfbW4JCSptbjsKIAot
CXVuaW9uIHsKLQkJc3RydWN0IGxpc3RfaGVhZAltbl9saXN0OwotCQlzdHJ1Y3QgbGlzdF9oZWFk
CXNoYWRvd19saXN0OwotCX07CisKKyNpZmRlZiBDT05GSUdfTU1VX05PVElGSUVSCisJc3RydWN0
IG1tdV9yYW5nZV9ub3RpZmllcglub3RpZmllcjsKKyNlbmRpZgorCisJc3RydWN0IGxpc3RfaGVh
ZAkJc2hhZG93X2xpc3Q7CiAKIAlzdHJ1Y3Qga2dkX21lbSAgICAgICAgICAgICAgICAgICprZmRf
Ym87CiB9OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
