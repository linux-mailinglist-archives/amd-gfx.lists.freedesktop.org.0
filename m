Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2D51CD1
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 23:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2FD89DF7;
	Mon, 24 Jun 2019 21:08:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DA889DE1
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x4so15364451wrt.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xvvvfm/iICt6EAx3A7hygYXF1jRJFUeMrawdTwOi4ns=;
 b=fcyNtPOQcx4nnuBHQlax3UaSFHLg6akSLPQWqIvlsW7n8bHtXfkMFoh+RZTlHMJr/q
 +LCwG/WuYdn6ptCt07AHVPgZXhnpML70J7n7PqJ6RCy9UM9tBeMDsUwgcgbevhuGMXFB
 i3SnT21IC64ABprUJzcfFTaJvt+KyQzRmEMyVwt3QCPHgSpV3qmLI0m05FCZXI3fdlAU
 py+8y01rV+8bcXKVJ8pfYi+vNfrPZO4DheHfZ+raB4GKShpuL8BEplqSY/GKJc7hCCEc
 suEivAOx45EDtGv4fJXi2FuanNinyYWJXhHbzGe2MAXZ83KcC/gQDN1qlWDH6wFBEn0O
 NvCw==
X-Gm-Message-State: APjAAAUst8QffjOg7v8wzqB1pYC6sRilO14gbcIQQX+Vi4BinM9l797k
 oKpEhvK0875K/QUYeUPQ02c3sg==
X-Google-Smtp-Source: APXvYqxEB08pD22xw7z431fz4zoGHVSBNwMRdaiB40BUYEvmuPcR/sYQyqDcLZPR3XganfuFLHNJMQ==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr28666603wrv.268.1561410126403; 
 Mon, 24 Jun 2019 14:02:06 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id j7sm16820277wru.54.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6C-0001MM-Sw; Mon, 24 Jun 2019 18:02:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 05/12] mm/hmm: Remove duplicate condition test before
 wait_event_timeout
Date: Mon, 24 Jun 2019 18:01:03 -0300
Message-Id: <20190624210110.5098-6-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Jun 2019 21:08:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xvvvfm/iICt6EAx3A7hygYXF1jRJFUeMrawdTwOi4ns=;
 b=oRmOk0Zjj6i+pMHvCNnVsb1wjfONs2JBTQnEE3rglcDcUQoG84gXWTDhq9ll76MAqu
 NbvHm5LXP2Mk44izNVB3slQr8uyWefSSkQB31EfSp+uwq/HLZh/BdNDnY90d603FucOz
 AC8Ce8Oh4o0dEDF5pq+h9XhIOGQHW9OrQOCgPMR6XEU0ePQEDlF6JmUB9j6v51IImlni
 0CRtVjdLLAq8G7uZWcwboxDMUZIuPWUPunZLZVkEDI1o2Eb0mtkYKg08tRTwS/QFWzk2
 3v3z9wVq/LNXCzMnbVfsewXyPw+o1BeCYz8bMIx9Jd6EvXRVTZY/u0AkUUg08yGiPfXO
 xJgA==
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
PGlyYS53ZWlueUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KVGVzdGVkLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KLS0t
CnYzCi0gU2ltcGxpZnkgdGhlIHdhaXRfZXZlbnRfdGltZW91dCB0byBub3QgY2hlY2sgdmFsaWQK
LS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oIHwgMTMgKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXggMWQ5N2I2ZDYyYzViY2Yu
LjI2ZTdjNDc3NDkwYzRlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2lu
Y2x1ZGUvbGludXgvaG1tLmgKQEAgLTIwOSwxNyArMjA5LDggQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIGhtbV9yYW5nZV9wYWdlX3NpemUoY29uc3Qgc3RydWN0IGhtbV9yYW5nZSAqcmFu
Z2UpCiBzdGF0aWMgaW5saW5lIGJvb2wgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UsCiAJCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgdGltZW91dCkKIHsK
LQkvKiBDaGVjayBpZiBtbSBpcyBkZWFkID8gKi8KLQlpZiAocmFuZ2UtPmhtbSA9PSBOVUxMIHx8
IHJhbmdlLT5obW0tPmRlYWQgfHwgcmFuZ2UtPmhtbS0+bW0gPT0gTlVMTCkgewotCQlyYW5nZS0+
dmFsaWQgPSBmYWxzZTsKLQkJcmV0dXJuIGZhbHNlOwotCX0KLQlpZiAocmFuZ2UtPnZhbGlkKQot
CQlyZXR1cm4gdHJ1ZTsKLQl3YWl0X2V2ZW50X3RpbWVvdXQocmFuZ2UtPmhtbS0+d3EsIHJhbmdl
LT52YWxpZCB8fCByYW5nZS0+aG1tLT5kZWFkLAotCQkJICAgbXNlY3NfdG9famlmZmllcyh0aW1l
b3V0KSk7Ci0JLyogUmV0dXJuIGN1cnJlbnQgdmFsaWQgc3RhdHVzIGp1c3QgaW4gY2FzZSB3ZSBn
ZXQgbHVja3kgKi8KLQlyZXR1cm4gcmFuZ2UtPnZhbGlkOworCXJldHVybiB3YWl0X2V2ZW50X3Rp
bWVvdXQocmFuZ2UtPmhtbS0+d3EsIHJhbmdlLT52YWxpZCwKKwkJCQkgIG1zZWNzX3RvX2ppZmZp
ZXModGltZW91dCkpICE9IDA7CiB9CiAKIC8qCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
