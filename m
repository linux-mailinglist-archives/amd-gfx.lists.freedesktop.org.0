Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB57D45664
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 09:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E70089915;
	Fri, 14 Jun 2019 07:32:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546D3892F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:59 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so555234qtn.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TdUL2Q0xcyDT6JNdu0gecxArNl/zROPizNaMNSjNgKw=;
 b=RkGVLZ67u8OquXJJ6NdHjne90H0ugXfz/mT7novwiiWEh8jE0PWptRteXdEtaD1sqQ
 /S0M8H5BHH8VNcZTAqidLF7u1goHvH03zRh25ntp6QxFS76lmzhL02FvBBMDUvwdsgqH
 RF+EI7ESFr5PhZLTZXbRwAgtrKjInTO6B1j4kEyixieUIJDJjPeVLPP/tUCBiD9Zrtxu
 wu1wqafMZxW3eHxrrx9JwafJ3rkbVjUX1olDVBCnoG3GCg0U5pIujkQEOsGCIngHCM3e
 bKWjWPxG4uNKh1dgv39QKZupcy4PdZwrihkWP4+O2DKtsvNHs4txSnPVqA92T1IQ0l+o
 AjcA==
X-Gm-Message-State: APjAAAWC2pM4kdKyiYRHT2Q0IsYD7IeT+qr6AHE0OrSJ23gaFqUnzttq
 v7vQOBW898YqOtxiZQPebJv2Mg==
X-Google-Smtp-Source: APXvYqzF52VUT6PLbBdFr+9hAJYSTEw5qk29kEu9lNT9XBNX8ynGL9sSdzpvwppRLNVS4ebk9QrzSQ==
X-Received: by 2002:aed:224e:: with SMTP id o14mr78885704qtc.271.1560473098488; 
 Thu, 13 Jun 2019 17:44:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id n48sm812748qtc.90.2019.06.13.17.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKr-0005KK-Vm; Thu, 13 Jun 2019 21:44:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 09/12] mm/hmm: Poison hmm_range during unregister
Date: Thu, 13 Jun 2019 21:44:47 -0300
Message-Id: <20190614004450.20252-10-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:32:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TdUL2Q0xcyDT6JNdu0gecxArNl/zROPizNaMNSjNgKw=;
 b=FK1BE5Q4R1zyEjUAK720jTuxSx/cyRhVSQ3jayrUcNyqoaPlGBfGmGC1CPOx43s3ST
 6RpK5IdpVUApoJZo8g1TT+C5zdvZ2TG9uTPr7XHg6jJi/A9cEPbHcheLCuTa0i1x7Z41
 Mi3bwHwKr3TrXQAMy8P4kjfKrR78HOCBwiNjC5ZDJZ0bKUEU0G6TbXkgv+rpTyv/xlcc
 dIOmYy6zgWm5Iw4sumeXpNYtGyd/WNLx1EtYDSkyfOURkacd+3GKhBbELl5JFem6hlqX
 2IL4K40Gw3ZaHhwFwAEd4IWGIF1j4HktqVkUa6VK5L2oBj8qFHmE/mdZt+ga7o2HmLyu
 aP3g==
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
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVHJ5aW5nIHRvIG1pc3Vz
ZSBhIHJhbmdlIG91dHNpZGUgaXRzIGxpZmV0aW1lIGlzIGEga2VybmVsIGJ1Zy4gVXNlIHBvaXNv
bgpieXRlcyB0byBoZWxwIGRldGVjdCB0aGlzIGNvbmRpdGlvbi4gRG91YmxlIHVucmVnaXN0ZXIg
d2lsbCByZWxpYWJseSBjcmFzaC4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpB
Y2tlZC1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClJldmlld2Vk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJ
cmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClRlc3RlZC1ieTogUGhpbGlwIFlhbmcgPFBo
aWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQp2MgotIEtlZXAgcmFuZ2Ugc3RhcnQvZW5kIHZhbGlkIGFm
dGVyIHVucmVnaXN0cmF0aW9uIChKZXJvbWUpCnYzCi0gUmV2aXNlIHNvbWUgY29tbWVudHMgKEpv
aG4pCi0gUmVtb3ZlIHN0YXJ0L2VuZCBXQVJOX09OIChTb3VwdGljaykKLS0tCiBtbS9obW0uYyB8
IDE0ICsrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggZTNlMGE4
MTFhM2E3NzQuLmUyMTQ2NjhjYmEzNDc0IDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9o
bW0uYwpAQCAtOTMzLDE5ICs5MzMsMjEgQEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSkKIHsKIAlzdHJ1Y3QgaG1tICpobW0gPSByYW5nZS0+aG1tOwog
Ci0JLyogU2FuaXR5IGNoZWNrIHRoaXMgcmVhbGx5IHNob3VsZCBub3QgaGFwcGVuLiAqLwotCWlm
IChobW0gPT0gTlVMTCB8fCByYW5nZS0+ZW5kIDw9IHJhbmdlLT5zdGFydCkKLQkJcmV0dXJuOwot
CiAJbXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsKIAlsaXN0X2RlbF9yY3UoJnJhbmdlLT5saXN0KTsK
IAltdXRleF91bmxvY2soJmhtbS0+bG9jayk7CiAKIAkvKiBEcm9wIHJlZmVyZW5jZSB0YWtlbiBi
eSBobW1fcmFuZ2VfcmVnaXN0ZXIoKSAqLwotCXJhbmdlLT52YWxpZCA9IGZhbHNlOwogCW1tcHV0
KGhtbS0+bW0pOwogCWhtbV9wdXQoaG1tKTsKLQlyYW5nZS0+aG1tID0gTlVMTDsKKworCS8qCisJ
ICogVGhlIHJhbmdlIGlzIG5vdyBpbnZhbGlkIGFuZCB0aGUgcmVmIG9uIHRoZSBobW0gaXMgZHJv
cHBlZCwgc28KKyAgICAgICAgICogcG9pc29uIHRoZSBwb2ludGVyLiAgTGVhdmUgb3RoZXIgZmll
bGRzIGluIHBsYWNlLCBmb3IgdGhlIGNhbGxlcidzCisgICAgICAgICAqIHVzZS4KKyAgICAgICAg
ICovCisJcmFuZ2UtPnZhbGlkID0gZmFsc2U7CisJbWVtc2V0KCZyYW5nZS0+aG1tLCBQT0lTT05f
SU5VU0UsIHNpemVvZihyYW5nZS0+aG1tKSk7CiB9CiBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV91
bnJlZ2lzdGVyKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
