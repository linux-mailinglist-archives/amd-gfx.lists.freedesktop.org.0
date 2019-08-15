Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CC8EC11
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 14:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72126E3D6;
	Thu, 15 Aug 2019 12:55:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2FF6E976;
 Thu, 15 Aug 2019 10:06:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0AB6168AFE; Thu, 15 Aug 2019 12:06:11 +0200 (CEST)
Date: Thu, 15 Aug 2019 12:06:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 1/4] drm/radeon: handle PCIe root ports with addressing
 limitations
Message-ID: <20190815100610.GA28728@lst.de>
References: <20190815072703.7010-1-hch@lst.de>
 <20190815072703.7010-2-hch@lst.de>
 <d1cf1435-92e3-edb5-c239-18c71f2d27c7@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1cf1435-92e3-edb5-c239-18c71f2d27c7@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 15 Aug 2019 12:55:51 +0000
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6MzQ6MTBBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gTG9va3Mgc2FuZSB0byBtZS4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uCj4gCj4gU2hvdWxkIHdlIG1lcmdlIHRoaXMg
dGhyb3VnaCBvdXIgbm9ybWFsIGFtZGdwdS9yYWRlb24gYnJhbmNoZXMgb3IgZG8geW91IAo+IHdh
bnQgdG8gc2VuZCB0aGlzIHVwc3RyZWFtIHNvbWVob3cgZWxzZT8KClRoaXMgaXMgaW50ZW5kZWQg
Zm9yIHlvdXIgdHJlZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
