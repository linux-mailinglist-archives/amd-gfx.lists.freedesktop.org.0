Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1FC7B464
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 22:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936E26E607;
	Tue, 30 Jul 2019 20:40:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479446E607;
 Tue, 30 Jul 2019 20:40:18 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull hmm changes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190730115831.GA15720@ziepe.ca>
References: <20190730115831.GA15720@ziepe.ca>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190730115831.GA15720@ziepe.ca>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
 tags/for-linus-hmm
X-PR-Tracked-Commit-Id: de4ee728465f7c0c29241550e083139b2ce9159c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 515f12b9eeed35250d793b7c874707c33f7f6e05
Message-Id: <156451921813.18459.2711445926920761419.pr-tracker-bot@kernel.org>
Date: Tue, 30 Jul 2019 20:40:18 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564519218;
 bh=rxzvltql7wVZw/jwNUEDC1Qb9+r4GqOzZran/66ezKg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=kCpNm0q+triJorfoXGYTORFoq/HS39NKRUfUtHqV0M0bRJcVPyTpWj6wG4Bc+zMPL
 iPZF7bfHnLxay59cZ/uuXJuXD1Oxxoc21SG2T3x8f1Alv0WDzhgnRN9sa7ObvZdPn/
 xvFeYcKzbG0K102nvvGz5KUQ1Ccb0UsnoeL0IHP0=
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
Cc: David Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUdWUsIDMwIEp1bCAyMDE5IDExOjU4OjM3ICsw
MDAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmRt
YS9yZG1hLmdpdCB0YWdzL2Zvci1saW51cy1obW0KCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZh
bGRzL2xpbnV4LmdpdDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzUxNWYxMmI5
ZWVlZDM1MjUwZDc5M2I3Yzg3NDcwN2MzM2Y3ZjZlMDUKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRv
b3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2Mv
cHJ0cmFja2VyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
