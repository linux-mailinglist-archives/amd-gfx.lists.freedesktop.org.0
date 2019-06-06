Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB137C84
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 20:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B849389780;
	Thu,  6 Jun 2019 18:48:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F9489686
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:48 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id t64so2142783qkh.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7+8VVGKVPXEVnSFQY2/eN+heRnF32oClEuR9RZcz4c=;
 b=JF0xHxi4rPMsi1PWmyHgnw5EgK6OocSFzxtdtHXfR4vfAZwSVR31JKjz5D4OWgX/Sx
 vMXLvgRSTBZWl7v9FpTnNt3xFEnK8BK8sxusHj37Gl1dqmyZ+wid23fuUbWL56fC+e5u
 kE6zQBVucwteSa0+chIyg3Jzw3s2vRNDm//mgdWVVF50mUbiq4CuIB/TS8Q8SpsNN6wZ
 XUWmpmRga71mQVQD4gK8PXCgu6sqJN3vsCgZV02w4gOqqTVjXIydR6PCyOY8Jx04lROR
 V0P3uXS+hNXRKZNEIi5f9ufjK+H2fX/ucqRc7xfxCg1nGg1bKCWd7x2dbtcV0DbuUXHR
 Xa1Q==
X-Gm-Message-State: APjAAAUq9hitIoo6eDRAq6FO0pk/1/nzkkaLpY6Z1d/heDtlXgQkBy6G
 vjNvCpO1B1Q8Bw8RUlrOg8dBlA==
X-Google-Smtp-Source: APXvYqzcNAbWl+BqHtgTaqiaVwnoaAOHy/kM0yjt/wGvoT6pCtDHNXa8FJTB1/3g0VUWQOgRUAVd7Q==
X-Received: by 2002:a05:620a:1ee:: with SMTP id
 x14mr39905952qkn.70.1559846687875; 
 Thu, 06 Jun 2019 11:44:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f6sm1303617qkk.79.2019.06.06.11.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008IT-Km; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test before
 wait_event_timeout
Date: Thu,  6 Jun 2019 15:44:32 -0300
Message-Id: <20190606184438.31646-6-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 18:48:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7+8VVGKVPXEVnSFQY2/eN+heRnF32oClEuR9RZcz4c=;
 b=awv3zzYYkAzknK7/NkCAiHR5B250y04djNp+WoYpexe7Uej2IPZ5cqDxrJR0439HDp
 Ip+tkYncoM6synNyttQstYPfXOCfvqJ+MFaPA020vji6f3V+ijeewe00T5WLlGVbBkip
 ta/ZcbdijmmX7p+PqFRh9FOoQWxBygNZCZjmbhPstNfn/mX4xsgnW1BaTUSYo/a8jPup
 YkMIRPOwMicKl54A6Y5BoXPtSil+jxKqN6rTDrLm8CETdgRy4WQzp8exudHeoEcxgA4t
 JqZxvdcH0B1B5+3aq+YyPAmAifoH1FgyXvEu+EF0wwHDyoaCdNCX+I1ObXgN34um9W9p
 meJg==
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
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIHdhaXRfZXZlbnRf
dGltZW91dCBtYWNybyBhbHJlYWR5IHRlc3RzIHRoZSBjb25kaXRpb24gYXMgaXRzIGZpcnN0CmFj
dGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBhbm90aGVyIHZlcnNpb24g
b2YgdGhpcywgYWxsCnRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnZ2lu
ZyBpbiBjb21tb24gY2FzZXMsIHdoaWNoIGlzCm5vdCBoZWxwZnVsLgoKRnVydGhlciwgYmFzZWQg
b24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vIHNpbXBsaWZ5IHRoZSByZXF1aXJlZCBjb25kaXRp
b24KdGVzdDoKIC0gSWYgcmFuZ2UgaXMgdmFsaWQgbWVtb3J5IHRoZW4gc28gaXMgcmFuZ2UtPmht
bQogLSBJZiBobW1fcmVsZWFzZSgpIGhhcyBydW4gdGhlbiByYW5nZS0+dmFsaWQgaXMgc2V0IHRv
IGZhbHNlCiAgIGF0IHRoZSBzYW1lIHRpbWUgYXMgZGVhZCwgc28gbm8gcmVhc29uIHRvIGNoZWNr
IGJvdGguCiAtIEEgdmFsaWQgaG1tIGhhcyBhIHZhbGlkIGhtbS0+bW0uCgpBbHNvLCBhZGQgdGhl
IFJFQURfT05DRSBmb3IgcmFuZ2UtPnZhbGlkIGFzIHRoZXJlIGlzIG5vIGxvY2sgaGVsZCBoZXJl
LgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZp
ZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9obW0uaCB8IDEyICsrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0u
aCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXggNGVlM2FjYWJlNWVkMjIuLjJhYjM1YjQwOTky
YjI0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgv
aG1tLmgKQEAgLTIxOCwxNyArMjE4LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGht
bV9yYW5nZV9wYWdlX3NpemUoY29uc3Qgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiBzdGF0aWMg
aW5saW5lIGJvb2wgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoc3RydWN0IGhtbV9yYW5nZSAq
cmFuZ2UsCiAJCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgdGltZW91dCkKIHsKLQkvKiBDaGVjayBp
ZiBtbSBpcyBkZWFkID8gKi8KLQlpZiAocmFuZ2UtPmhtbSA9PSBOVUxMIHx8IHJhbmdlLT5obW0t
PmRlYWQgfHwgcmFuZ2UtPmhtbS0+bW0gPT0gTlVMTCkgewotCQlyYW5nZS0+dmFsaWQgPSBmYWxz
ZTsKLQkJcmV0dXJuIGZhbHNlOwotCX0KLQlpZiAocmFuZ2UtPnZhbGlkKQotCQlyZXR1cm4gdHJ1
ZTsKLQl3YWl0X2V2ZW50X3RpbWVvdXQocmFuZ2UtPmhtbS0+d3EsIHJhbmdlLT52YWxpZCB8fCBy
YW5nZS0+aG1tLT5kZWFkLAorCXdhaXRfZXZlbnRfdGltZW91dChyYW5nZS0+aG1tLT53cSwgcmFu
Z2UtPnZhbGlkLAogCQkJICAgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KSk7Ci0JLyogUmV0dXJu
IGN1cnJlbnQgdmFsaWQgc3RhdHVzIGp1c3QgaW4gY2FzZSB3ZSBnZXQgbHVja3kgKi8KLQlyZXR1
cm4gcmFuZ2UtPnZhbGlkOworCXJldHVybiBSRUFEX09OQ0UocmFuZ2UtPnZhbGlkKTsKIH0KIAog
LyoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
