Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1B45669
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 09:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1489954;
	Fri, 14 Jun 2019 07:32:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FEF892F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:55 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so615108qtk.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/AhTlxkz9VD/Gth3t6L3luS1MUasGphGhAFUOpm608=;
 b=Hv2IOsefUV5i3yQ5hbHog7f+HajZ+FsSSpxx5RXWwEjGKCG3NZCvPFirwfHmIf//J6
 sxnVQlIcUfooRcpY6UwlWQ5+naUUo28AZGarL9gQJRv3cq+uUfe5bq4cHA2k0uwUl1eA
 1iAQEJugnTAHFFPdDNc0RJoFyFYJHvwBcavhujZ5WHfAsil2g1wJIS5DbEw/GR88Hp1H
 3Wh/I9tQKMqaU+oG1/0LF5uZqqM+/CNeYp8oBtgZRqoc/6GJlPVzsTwt4KdE/fUYj1+4
 P5sUQIi9cWB14J94beOLdupqYh2z7lusL/9pZNutn4m0l7winl7qt0P++gbS9QhSLkdD
 XC8g==
X-Gm-Message-State: APjAAAX4LouqiZOyNMhzWKBZibMUug1ZoV6/VMzXUQm3bbzzcJkc19JF
 IKJyynynUwKBVo9tjGXN1wa4bw==
X-Google-Smtp-Source: APXvYqwwLhCAHZe6HhzxmL/Iw5P6iX8RWN7iT/fwDDndsKBg+CvZVk5Nt+VA+fnelddHK4pmtIZtkw==
X-Received: by 2002:aed:3ed5:: with SMTP id o21mr76020282qtf.369.1560473094348; 
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c55sm754749qtk.53.2019.06.13.17.44.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKr-0005JR-I5; Thu, 13 Jun 2019 21:44:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 00/12] mm/hmm: Various revisions from a locking/code
 review
Date: Thu, 13 Jun 2019 21:44:38 -0300
Message-Id: <20190614004450.20252-1-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:32:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/AhTlxkz9VD/Gth3t6L3luS1MUasGphGhAFUOpm608=;
 b=lwkJgPljFC3Tn+LXK7qjmyhVvethI42H5ylf1MGRcm6oKxXVhq8Wzl8TRDe9Eqm+YN
 rJkB0pghRseSkcWlc54ohBbckUGirR4baXgc8115jYObInJrRLwQtP1X+52KdX8JiSYG
 ZULIP8XcgCXVOf6rHO/PNjB1SdPHt7h/hl6bwATGZ4PjbayxrcZKj0MW25KMUNfW8oby
 AUpBHYJLOgSKHGgD0ip9zurdr2qqnIm8rtMl4gsk1TRGtmQsYhUxbnXWYhvO49MrsJaQ
 CyFu2i3cjrPLnh9c7W2+KHMZZ1HkvmrdKx7z9NMxZ/34RA3NYsFe25qalY3RhhfJ8whk
 95HQ==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBwYXRjaCBzZXJp
ZXMgYXJpc2VkIG91dCBvZiBkaXNjdXNzaW9ucyB3aXRoIEplcm9tZSB3aGVuIGxvb2tpbmcgYXQg
dGhlCk9EUCBjaGFuZ2VzLCBwYXJ0aWN1bGFybHkgaW5mb3JtZWQgYnkgdXNlIGFmdGVyIGZyZWUg
cmFjZXMgd2UgaGF2ZSBhbHJlYWR5CmZvdW5kIGFuZCBmaXhlZCBpbiB0aGUgT0RQIGNvZGUgKHRo
YW5rcyB0byBzeXprYWxsZXIpIHdvcmtpbmcgd2l0aCBtbXUKbm90aWZpZXJzLCBhbmQgdGhlIGRp
c2N1c3Npb24gd2l0aCBSYWxwaCBvbiBob3cgdG8gcmVzb2x2ZSB0aGUgbGlmZXRpbWUgbW9kZWwu
CgpPdmVyYWxsIHRoaXMgYnJpbmdzIGluIGEgc2ltcGxpZmllZCBsb2NraW5nIHNjaGVtZSBhbmQg
ZWFzeSB0byBleHBsYWluCmxpZmV0aW1lIG1vZGVsOgoKIElmIGEgaG1tX3JhbmdlIGlzIHZhbGlk
LCB0aGVuIHRoZSBobW0gaXMgdmFsaWQsIGlmIGEgaG1tIGlzIHZhbGlkIHRoZW4gdGhlIG1tCiBp
cyBhbGxvY2F0ZWQgbWVtb3J5LgoKIElmIHRoZSBtbSBuZWVkcyB0byBzdGlsbCBiZSBhbGl2ZSAo
aWUgdG8gbG9jayB0aGUgbW1hcF9zZW0sIGZpbmQgYSB2bWEsIGV0YykKIHRoZW4gdGhlIG1tZ2V0
IG11c3QgYmUgb2J0YWluZWQgdmlhIG1tZ2V0X25vdF96ZXJvKCkuCgpUaGUgdXNlIHVubG9ja2Vk
IHJlYWRzIG9uICdobW0tPmRlYWQnIGFyZSBhbHNvIGVsaW1pbmF0ZWQgaW4gZmF2b3VyIG9mIHVz
aW5nCnN0YW5kYXJkIG1tZ2V0KCkgbG9ja2luZyB0byBwcmV2ZW50IHRoZSBtbSBmcm9tIGJlaW5n
IHJlbGVhc2VkLiBNYW55IG9mIHRoZQpkZWJ1Z2dpbmcgY2hlY2tzIG9mICFyYW5nZS0+aG1tIGFu
ZCAhaG1tLT5tbSBhcmUgZHJvcHBlZCBpbiBmYXZvdXIgb2YgcG9pc29uIC0Kd2hpY2ggaXMgbXVj
aCBjbGVhcmVyIGFzIHRvIHRoZSBsaWZldGltZSBpbnRlbnQuCgpUaGUgdHJhaWxpbmcgcGF0Y2hl
cyBhcmUganVzdCBzb21lIHJhbmRvbSBjbGVhbnVwcyBJIG5vdGljZWQgd2hlbiByZXZpZXdpbmcK
dGhpcyBjb2RlLgoKSSB3b3VsZCBsaWtlIHRvIHJ1biBzb21lIHRlc3Rpbmcgd2l0aCB0aGUgT0RQ
IHBhdGNoLCBidXQgaGF2ZW4ndAp5ZXQuIE90aGVyd2lzZSBJIHRoaW5rIHRoaXMgaXMgcmV2aWV3
ZWQgZW5vdWdoLCBhbmQgaWYgdGhlcmUgaXMgbm90aGluZyBtb3JlCnNheSBJIGhvcGUgdG8gYXBw
bHkgaXQgbmV4dCB3ZWVrLgoKSSBwbGFuIHRvIGNvbnRpbnVlIHRvIHdvcmsgb24gdGhlIGlkZWEg
d2l0aCBDSCB0byBtb3ZlIG1vcmUgb2YgdGhpcyBtaXJyb3IKY29kZSBpbnRvIG1tdSBub3RpZmll
cnMgYW5kIG90aGVyIHBsYWNlcywgYnV0IHRoaXMgd2lsbCB0YWtlIHNvbWUgdGltZSBhbmQKcmVz
ZWFyY2guCgpUaGFua3MgdG8gZXZlcnlvbmUgd2hvIHRvb2sgdGltZSB0byBsb29rIGF0IHRoaXMh
CgpKYXNvbiBHdW50aG9ycGUgKDEyKToKICBtbS9obW06IGZpeCB1c2UgYWZ0ZXIgZnJlZSB3aXRo
IHN0cnVjdCBobW0gaW4gdGhlIG1tdSBub3RpZmllcnMKICBtbS9obW06IFVzZSBobW1fbWlycm9y
IG5vdCBtbSBhcyBhbiBhcmd1bWVudCBmb3IgaG1tX3JhbmdlX3JlZ2lzdGVyCiAgbW0vaG1tOiBI
b2xkIGEgbW1ncmFiIGZyb20gaG1tIHRvIG1tCiAgbW0vaG1tOiBTaW1wbGlmeSBobW1fZ2V0X29y
X2NyZWF0ZSBhbmQgbWFrZSBpdCByZWxpYWJsZQogIG1tL2htbTogUmVtb3ZlIGR1cGxpY2F0ZSBj
b25kaXRpb24gdGVzdCBiZWZvcmUgd2FpdF9ldmVudF90aW1lb3V0CiAgbW0vaG1tOiBIb2xkIG9u
IHRvIHRoZSBtbWdldCBmb3IgdGhlIGxpZmV0aW1lIG9mIHRoZSByYW5nZQogIG1tL2htbTogVXNl
IGxvY2tkZXAgaW5zdGVhZCBvZiBjb21tZW50cwogIG1tL2htbTogUmVtb3ZlIHJhY3kgcHJvdGVj
dGlvbiBhZ2FpbnN0IGRvdWJsZS11bnJlZ2lzdHJhdGlvbgogIG1tL2htbTogUG9pc29uIGhtbV9y
YW5nZSBkdXJpbmcgdW5yZWdpc3RlcgogIG1tL2htbTogRG8gbm90IHVzZSBsaXN0Kl9yY3UoKSBm
b3IgaG1tLT5yYW5nZXMKICBtbS9obW06IFJlbW92ZSBjb25mdXNpbmcgY29tbWVudCBhbmQgbG9n
aWMgZnJvbSBobW1fcmVsZWFzZQogIG1tL2htbTogRml4IGVycm9yIGZsb3dzIGluIGhtbV9pbnZh
bGlkYXRlX3JhbmdlX3N0YXJ0CgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0u
YyB8ICAgMiArLQogaW5jbHVkZS9saW51eC9obW0uaCAgICAgICAgICAgICAgICAgICB8ICA1MiAr
LS0tLQoga2VybmVsL2ZvcmsuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSAtCiBtbS9o
bW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjg2ICsrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCspLCAyMDEgZGVsZXRp
b25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
