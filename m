Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7661BA27C
	for <lists+amd-gfx@lfdr.de>; Sun, 22 Sep 2019 14:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CAF6E8C1;
	Sun, 22 Sep 2019 12:05:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081CB6E075;
 Sat, 21 Sep 2019 17:40:22 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull hmm related changes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190916162350.GA19191@ziepe.ca>
References: <20190916162350.GA19191@ziepe.ca>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190916162350.GA19191@ziepe.ca>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
 tags/for-linus-hmm
X-PR-Tracked-Commit-Id: 62974fc389b364d8af70e044836362222bd3ae53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 84da111de0b4be15bd500deff773f5116f39f7be
Message-Id: <156908762129.32622.9253749641256776927.pr-tracker-bot@kernel.org>
Date: Sat, 21 Sep 2019 17:40:21 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569087621;
 bh=LsJ4KroFpbZgHfIznXa/jo/IJP0ugyfdqLBIjhc8268=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=n6E7JQXe8lfUX+FaNG3J+BYya8cbdUEeLMb5493L7IbpwanV8sKgytc7F7dtJJl+X
 YjHEfN1f8jVJtTyKyC+iccEBHw6eLdZDJyNoYh4DJSM09PrXbKWFTlSE0jE9DKn1Bn
 V5mLYnWP9WTwNf5ger3difRJGdlkUKrHh5JlYecQ=
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
Cc: Dimitri Sivanich <sivanich@hpe.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBNb24sIDE2IFNlcCAyMDE5IDE2OjIzOjU3ICsw
MDAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmRt
YS9yZG1hLmdpdCB0YWdzL2Zvci1saW51cy1obW0KCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZh
bGRzL2xpbnV4LmdpdDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzg0ZGExMTFk
ZTBiNGJlMTViZDUwMGRlZmY3NzNmNTExNmYzOWY3YmUKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRv
b3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2Mv
cHJ0cmFja2VyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
