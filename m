Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 474648E721
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 10:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A02B6E92B;
	Thu, 15 Aug 2019 08:41:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FA16E8B6;
 Thu, 15 Aug 2019 07:27:07 +0000 (UTC)
Received: from [2001:4bb8:18c:28b5:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyAA5-00010N-ER; Thu, 15 Aug 2019 07:27:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: fix radeon and amdgpu for addressing limited root ports
Date: Thu, 15 Aug 2019 09:26:59 +0200
Message-Id: <20190815072703.7010-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:41:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+X8zwPq8S6+jgiNwNmZZqZ3I4CZ0qtOw1LdSC6GCvo=; b=Z/SaBQ2KGXUwFnDt7b9/Sa4p1
 8E0EexaNqFj9QRIBLRdZMFGuHVnx9sHvKE+fJN6KXSfU7q+k4l3Q2GTVjja4i6jdGxCvR66pEkR31
 487Gvu0pq6WYuhsOZ85Nt4PsrEZ73INHPmg/L/iOeAS5eUT/oF9Lhoorv/siN7rZmvI94qjW9QJns
 rqoo3DVF/2ZwD/3pJ3lbsaGQgyjCmLC24+3y3wriJCKyilAKp4iIHD9cGfLLMUkpsFlucDjFkzHjx
 4GosdAIhIp8DqzRkPZjaq5SI6BXpCWIeEjM6XC3xuOe0l1tBvRGy17UM1hUDT52ifHOS2sXvMXjbw
 4q4M2jStA==;
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQU1EIGdyYXBoaWNzIG1haW50YWluZXJzLAoKdGhpcyBzZXJpZXMgZml4ZXMgYSBwcm9ibGVt
IGluIHRoZSByYWRlb24gZHJpdmVyIGZvciBzeXN0ZW1zIHdoZXJlIHRoZQpQQ0llIHJvb3QgcG9y
dCBvbmx5IHN1cHBvcnRzIGxpbWl0ZWQgKDMyLWJpdCkgYWRkcmVzc2luZyBhcyByZXBvcnRlZApi
eSBBdGlzaC4gIEkgdGhlbiBhbHNvIGZpeGVkIHRoZSBzYW1lIGlzc3VlIGluIGFtZGdwdSBhcyB0
aGUgY29kZSB3YXMKY29weSBhbmQgcGFzdGVkIHRoZXJlLCBhbmQgY2xlYW5lZCB1cCB0aGUgZG1h
IG1hc2sgc2V0dGluZyB3aGlsZQp0b3VjaGluZyB0aGF0IGFyZWEuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
