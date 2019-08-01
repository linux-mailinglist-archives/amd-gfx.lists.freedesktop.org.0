Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB217E2EB
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542F76E788;
	Thu,  1 Aug 2019 19:02:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED0C6E788
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:02:35 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2836021D6E;
 Thu,  1 Aug 2019 15:02:31 -0400 (EDT)
Received: from imap35 ([10.202.2.85])
 by compute6.internal (MEProxy); Thu, 01 Aug 2019 15:02:31 -0400
X-ME-Sender: <xms:RjdDXX0cfdMiS7nabGuWDjdoGUTY_GN8aWEGHXYwKHZrxLJWvD83AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleejgddufedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflrgih
 ucevohhrnhifrghllhdfuceojhgrhiesjhgtohhrnhifrghllhdrtghomheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehjrgihsehjtghorhhnfigrlhhlrdgtohhmnecuvehluhhs
 thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:RjdDXQJ6A7bXkwt7BYi2XeYTPxvkQWtZ2ueVyvnhITXq4jXcznideA>
 <xmx:RjdDXc0Km-JKqEuXt_HVSvQm9_ah3eyceLUNxxy-r88iEWmJkSZxpA>
 <xmx:RjdDXUmqofwozQPOtG8OBzzDQb5kZFGxTdxh0Nduxf5re4y74npBSw>
 <xmx:RzdDXfPH4NqoOIJPOQzdcHL_a2ex_IH2j3cNd8GA_vzkx4B-kPLavg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7109414C0062; Thu,  1 Aug 2019 15:02:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <98bcc2b1-43ae-4a7d-8220-90861d881c2e@www.fastmail.com>
In-Reply-To: <20190801184741.20064-2-alexander.deucher@amd.com>
References: <20190801184741.20064-1-alexander.deucher@amd.com>
 <20190801184741.20064-2-alexander.deucher@amd.com>
Date: Thu, 01 Aug 2019 14:01:38 -0500
From: "Jay Cornwall" <jay@jcornwall.com>
To: "Alex Deucher" <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amdkfd: Extend CU mask to 8 SEs (v2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jcornwall.com; 
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=JBHyu7zUA47bMaXslvhD/RsX77fK
 PdfnCMHlCbqgTqk=; b=rFSau09ImcflDB6Bgh2Y7RbB+froT3PEDnKUX6i5BY8k
 BrD8Ouciidqxn9pnzZmflUSy5ba9BNtpa5lE4iazx/MGVl92wBE0hbXmQYpiyG34
 eCzS6TIgVRUGkvZiQE7fEx+P7k7pKGIejIHJDY+kEdnQaNMxcfCpYUP1jTCr9pEn
 1+wN3H0QSFISd6oyuF1M0wKhS2/ome3NAl4UkT+od/yuueDBIxuORdIC8wWM6hop
 q14DouOYm2Uz0M12n6uGfxA528oojY2ECwPjxPHdfwTQ1ZiGOZ9ZGdNIwoq8jJa3
 9W23iAQuzXsw9fqxSRwUgaUs6WdG1VbF6a9b1O1yzQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JBHyu7
 zUA47bMaXslvhD/RsX77fKPdfnCMHlCbqgTqk=; b=TAuyAxlgMUVLJ+KTdqGWO1
 CF2sGea9vUpw9NYOGvyLfQ5rumqnoYaxhkgnS3EXSMDQsheOGhCE5qOEomA5PvW4
 Ns1dRB3aB/fSRdumQMzPTlvZVqSYgfVD9ZcvZko+bAIzgNWadUzBkNATq6UW1wvQ
 jwULTNzt8Sv4j4ixTGVTgrCBMNhoTlwZ7SX6Flj4UKV4HfNwtk7AXiywWvPgTDXR
 x8sYfOhTjDBtQ+f65c94o1Cdp9oh4G8tpHOxutMdojmHUicMe+4JdnkLVLwCzrOG
 iGrEWzSH0/K5Fh0D28uxQrH1OlqGC+QwyvfC7LpqdMViLIIJa2yI/O46MCa6Lf2w
 ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Jay Cornwall <Jay.Cornwall@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSwgYXQgMTM6NDcsIEFsZXggRGV1Y2hlciB3cm90ZToKPiBGcm9t
OiBKYXkgQ29ybndhbGwgPEpheS5Db3Jud2FsbEBhbWQuY29tPgo+IAo+IEZvbGxvd2luZyBiaXRt
YXAgbGF5b3V0IGxvZ2ljIGludHJvZHVjZWQgYnk6Cj4gImRybS9hbWRncHU6IHN1cHBvcnQgZ2V0
X2N1X2luZm8gZm9yIEFyY3R1cnVzIi4KPiAKPiB2Mjogc3F1YXNoIGluIGZpeHVwIGZvciBnZnhf
djlfMC5jIChBbGV4KQoKVGhlcmUncyBhIHNlY29uZCBwYXRjaCB0byBzcXVhc2gsIHdoaWNoIGZp
eGVkIGJyZWFrYWdlIGhlcmUgKCUjIHN3YXBwZWQpOgoKPiAtCXByX2RlYnVnKCJ1cGRhdGUgY3Ug
bWFzayB0byAlI3ggJSN4ICUjeCAlI3hcbiIsCj4gKwlwcl9kZWJ1ZygidXBkYXRlIGN1IG1hc2sg
dG8gIyV4ICMleCAjJXggIyV4ICMleCAjJXggIyV4ICMleFxuIiwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
