Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CEB4566E
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 09:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F1B89A1E;
	Fri, 14 Jun 2019 07:32:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD96892F6
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:57 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m29so634547qtu.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TWMeUG5gYhJoHE/SGg4kXx8gam66v1Nu5XHiuhyFtI=;
 b=nds8aRwSj58MSfTCWTjFgATbENYJoel+dCUKFinBTaVlWKZphY1jlcDadmhAIeyAnA
 XkhOmZelq+u01b+1lbxkVS2peTVhDFT8jHlMEOF+fGLsn6HqQOqozjzfMm44C56jYm6X
 63zdGeMs6zWdPpTH+0hRu0F3uBDb1ylEcVSY7Dvh4Rfoq4309dl7cDMkylU04/wwgzZD
 vm9VrIg84fqb3O0kPtYqEQxKnadrQ6VE4hdnREFjAu79xrbAWYOp2T4DKKN3biGRj4cF
 F/BabD3rNk1+rLsihvwluDaNBkzlEMl/IUlm2Pfz8JgkL0KzpLerU9G2tZFeP/WD+cRP
 NjDA==
X-Gm-Message-State: APjAAAX+4zFRw9sQBF2iavcsMLTr5/pUnYhl8RMVdQxYi4nmY5WovqHo
 ZPm8GGf1WjbwI1+0oEZyLRWRqw==
X-Google-Smtp-Source: APXvYqwqGlFwoXSFqE9WKQZMugVvrqSYWsVu7EvQI2b+rocz25JrwetUsVc8pOMWgciELT4SKnPuKA==
X-Received: by 2002:ac8:3014:: with SMTP id f20mr78276048qte.69.1560473097168; 
 Thu, 13 Jun 2019 17:44:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id g53sm678695qtk.65.2019.06.13.17.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKr-0005Jw-Px; Thu, 13 Jun 2019 21:44:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 05/12] mm/hmm: Remove duplicate condition test before
 wait_event_timeout
Date: Thu, 13 Jun 2019 21:44:43 -0300
Message-Id: <20190614004450.20252-6-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:32:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TWMeUG5gYhJoHE/SGg4kXx8gam66v1Nu5XHiuhyFtI=;
 b=Z24AVcLXtS9fjUgk7s4+KXtzjE1aMT2PBcEb07xw67SglUSd3OzuNg62oNcMTOdCCO
 tuaeQKOzQsp5HbqBLHd8K7YGNauURpRUKgNdhJfNe96/SZel8ZB2rP2x8NzbogFeDlIr
 +yZSWZUazmveTBDnu7n84ZdABGyatv0J9NLBsDYYL9OXjABLlvao0fEL2KwxuHwW8PZp
 /+vezcHxEC4oBD4j7w/eFErEFwQXwCtbfqwi4hyrQWWNYY2o77J7tHghIjFCTg3ZdCds
 UZ2dBkr9KXBNBNjxQciAe4xHvlePPQaKw/4isjgNYaLJ9hRnWkLaIVZIqWtqd6dVzykM
 qQrQ==
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
 Ira Weiny <ira.weiny@intel.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIHdhaXRfZXZlbnRf
dGltZW91dCBtYWNybyBhbHJlYWR5IHRlc3RzIHRoZSBjb25kaXRpb24gYXMgaXRzIGZpcnN0CmFj
dGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBhbm90aGVyIHZlcnNpb24g
b2YgdGhpcywgYWxsCnRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnZ2lu
ZyBpbiBjb21tb24gY2FzZXMsIHdoaWNoIGlzCm5vdCBoZWxwZnVsLgoKRnVydGhlciwgYmFzZWQg
b24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vdyBzaW1wbGlmeSB0aGUgcmVxdWlyZWQgY29uZGl0
aW9uCnRlc3Q6CiAtIElmIHJhbmdlIGlzIHZhbGlkIG1lbW9yeSB0aGVuIHNvIGlzIHJhbmdlLT5o
bW0KIC0gSWYgaG1tX3JlbGVhc2UoKSBoYXMgcnVuIHRoZW4gcmFuZ2UtPnZhbGlkIGlzIHNldCB0
byBmYWxzZQogICBhdCB0aGUgc2FtZSB0aW1lIGFzIGRlYWQsIHNvIG5vIHJlYXNvbiB0byBjaGVj
ayBib3RoLgogLSBBIHZhbGlkIGhtbSBoYXMgYSB2YWxpZCBobW0tPm1tLgoKQWxsb3dpbmcgdGhl
IHJldHVybiB2YWx1ZSBvZiB3YWl0X2V2ZW50X3RpbWVvdXQoKSAoYWxvbmcgd2l0aCBpdHMgaW50
ZXJuYWwKYmFycmllcnMpIHRvIGNvbXB1dGUgdGhlIHJlc3VsdCBvZiB0aGUgZnVuY3Rpb24uCgpT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+ClJldmlld2Vk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2Vpbnkg
PGlyYS53ZWlueUBpbnRlbC5jb20+ClRlc3RlZC1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5n
QGFtZC5jb20+Ci0tLQp2MwotIFNpbXBsaWZ5IHRoZSB3YWl0X2V2ZW50X3RpbWVvdXQgdG8gbm90
IGNoZWNrIHZhbGlkCi0tLQogaW5jbHVkZS9saW51eC9obW0uaCB8IDEzICsrLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmluZGV4IDFk
OTdiNmQ2MmM1YmNmLi4yNmU3YzQ3NzQ5MGM0ZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9o
bW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC0yMDksMTcgKzIwOSw4IEBAIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBobW1fcmFuZ2VfcGFnZV9zaXplKGNvbnN0IHN0cnVjdCBo
bW1fcmFuZ2UgKnJhbmdlKQogc3RhdGljIGlubGluZSBib29sIGhtbV9yYW5nZV93YWl0X3VudGls
X3ZhbGlkKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCQkJCQkgICAgICB1bnNpZ25lZCBsb25n
IHRpbWVvdXQpCiB7Ci0JLyogQ2hlY2sgaWYgbW0gaXMgZGVhZCA/ICovCi0JaWYgKHJhbmdlLT5o
bW0gPT0gTlVMTCB8fCByYW5nZS0+aG1tLT5kZWFkIHx8IHJhbmdlLT5obW0tPm1tID09IE5VTEwp
IHsKLQkJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Ci0JCXJldHVybiBmYWxzZTsKLQl9Ci0JaWYgKHJh
bmdlLT52YWxpZCkKLQkJcmV0dXJuIHRydWU7Ci0Jd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5o
bW0tPndxLCByYW5nZS0+dmFsaWQgfHwgcmFuZ2UtPmhtbS0+ZGVhZCwKLQkJCSAgIG1zZWNzX3Rv
X2ppZmZpZXModGltZW91dCkpOwotCS8qIFJldHVybiBjdXJyZW50IHZhbGlkIHN0YXR1cyBqdXN0
IGluIGNhc2Ugd2UgZ2V0IGx1Y2t5ICovCi0JcmV0dXJuIHJhbmdlLT52YWxpZDsKKwlyZXR1cm4g
d2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndxLCByYW5nZS0+dmFsaWQsCisJCQkJICBt
c2Vjc190b19qaWZmaWVzKHRpbWVvdXQpKSAhPSAwOwogfQogCiAvKgotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
