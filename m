Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25951CD3
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 23:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE88589DFD;
	Mon, 24 Jun 2019 21:08:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F0689DE1
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n4so15321694wrw.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rs1sEkzygtR6lbRJ0eUbAFkZlHYnT1CPNgA7awG9NQc=;
 b=Ddu8qHBGgEK8mhuTxBnjCPbakNQYttdR6tInb2/NVpW455r6BxGSIS9eNPYSuWgpFj
 7jU4k9GtNS8jbIy4e2bjigrRUreOQQiQcj3lXyPpbbpmqEk5HJjEP1e/WCvLKkxzJqDL
 myBZbrdKRWm+nAZFfLfuKLigYaL2z1ylK6fLy6Ar7snSatx4YSJl6sTXOnyiHplZsWyo
 PVoRTzX7pJgGZ1hXoYm1mYLMBnryeDjzEAEOwWze6mU8Ac3PdvwJeGfq/F3RjwsDkCs2
 +jbV1iOTwHZjeA+ur5/S/0NJPzgQAMLYYBONgGb6QSY85E2VNMXHPZJEvdM7Z5KmJnPV
 O5aA==
X-Gm-Message-State: APjAAAUSR1ORIiyV15QYKUYQUnCkMlYBkYToHvGwcE2VHnCyoZoud60w
 sMPZkDugvZAuMJwS+ds5vrHI0A==
X-Google-Smtp-Source: APXvYqxoDaUcVHfte6JF2hIkD4U/Q2PNoEzAwuS3zYv3vRjkVzwDyM9fIRPi2AhLNMqFWzhsn/OFnQ==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr102260622wrv.164.1561410123399; 
 Mon, 24 Jun 2019 14:02:03 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id h14sm11086221wrs.66.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6D-0001Mp-1k; Mon, 24 Jun 2019 18:02:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 09/12] mm/hmm: Remove racy protection against
 double-unregistration
Date: Mon, 24 Jun 2019 18:01:07 -0300
Message-Id: <20190624210110.5098-10-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Jun 2019 21:08:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rs1sEkzygtR6lbRJ0eUbAFkZlHYnT1CPNgA7awG9NQc=;
 b=f0F8mUp38+BSw/O1WjANVXVVMw8zhFZORjdRX1RtgtwdBgUWBtS4DuFgknhtRckqjJ
 fDPYac3PHVynkBRdhou+SH6UptVQIxVUIQifavRFZYv+BeWfES7diE3vVczt6RfpUEOL
 HKyKRdDLLYkWyPF33zlBvSCxa/KBn2/+Y2Sy1hmyEQzxoSkWZdP4GxRWfGqLBUquGL9C
 Ly8tJeOzyL9mpaDnKGNVFtycDXcnewWGVJEzIZFjBXuryCCVlKkVubMEGUB9qDKesfui
 S5zt2wnmoNX0dsm2two3hmXge0XbsLY2LY0GsVP/TYD0CD+hqf8x5J0pMRR0Lz+jvG54
 bukQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTm8gb3RoZXIgcmVnaXN0
ZXIvdW5yZWdpc3RlciBrZXJuZWwgQVBJIGF0dGVtcHRzIHRvIHByb3ZpZGUgdGhpcyBraW5kIG9m
CnByb3RlY3Rpb24gYXMgaXQgaXMgaW5oZXJlbnRseSByYWN5LCBzbyBqdXN0IGRyb3AgaXQuCgpD
YWxsZXJzIHNob3VsZCBwcm92aWRlIHRoZWlyIG93biBwcm90ZWN0aW9uLCBhbmQgaXQgYXBwZWFy
cyBub3V2ZWF1CmFscmVhZHkgZG9lcy4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUBy
ZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29t
PgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClRlc3RlZC1ieTogUGhpbGlw
IFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQp2MwotIERyb3AgcG9pc29uLCBsb29rcyBs
aWtlIHRoZXJlIGFyZSBubyBuZXcgcGF0Y2hlcyB0aGF0IHdpbGwgdXNlIHRoaXMKICB3cm9uZyAo
Q2hyaXN0b3BoKQotLS0KIG1tL2htbS5jIHwgOCArLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0v
aG1tLmMKaW5kZXggNmY1ZGM2ZDU2OGZlYjEuLjJlZjE0YjJiNTUwNWY2IDEwMDY0NAotLS0gYS9t
bS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtMjc2LDE3ICsyNzYsMTEgQEAgRVhQT1JUX1NZTUJP
TChobW1fbWlycm9yX3JlZ2lzdGVyKTsKICAqLwogdm9pZCBobW1fbWlycm9yX3VucmVnaXN0ZXIo
c3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcikKIHsKLQlzdHJ1Y3QgaG1tICpobW0gPSBSRUFEX09O
Q0UobWlycm9yLT5obW0pOwotCi0JaWYgKGhtbSA9PSBOVUxMKQotCQlyZXR1cm47CisJc3RydWN0
IGhtbSAqaG1tID0gbWlycm9yLT5obW07CiAKIAlkb3duX3dyaXRlKCZobW0tPm1pcnJvcnNfc2Vt
KTsKIAlsaXN0X2RlbF9pbml0KCZtaXJyb3ItPmxpc3QpOwotCS8qIFRvIHByb3RlY3QgdXMgYWdh
aW5zdCBkb3VibGUgdW5yZWdpc3RlciAuLi4gKi8KLQltaXJyb3ItPmhtbSA9IE5VTEw7CiAJdXBf
d3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwotCiAJaG1tX3B1dChobW0pOwogfQogRVhQT1JUX1NZ
TUJPTChobW1fbWlycm9yX3VucmVnaXN0ZXIpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
