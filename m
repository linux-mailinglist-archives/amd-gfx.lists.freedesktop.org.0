Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DF80D1CD
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Dec 2023 17:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC2410E4C5;
	Mon, 11 Dec 2023 16:31:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEFB10E4A4
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Dec 2023 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=4HnagbOJonb+x6IstHctUf9ht4
 OgV9P3OzAjZHHA+wBtF3soPL+84Q+8Ow5Dy+Tg0bBJi3pKlWMRn6liq03gzvVmLmsFiCJI27eai8K
 fDXtdcjcHZd8wWhJL+qm6215qCWUBTk0SSEkFbHcTftQnohN5Hi6VkRi96prYI6ZEUUuB5AUk7Guc
 D9X+eZ+K8uOeZaoUNo8SiBLHKOnwDO3kAo3gmg8rt4tz3gjcpi7P4JxDrWh6dxAIw71FcJuR8VYxM
 fyHVNAJN8VaRlFrugZy7Zo3+h08hWIvvbKWHPS5UWSdMFd30eF60CpVfSXPKE8CB0PmMzSlO2Lvm+
 kTdvx7ZQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rCizm-005kHT-2F; Mon, 11 Dec 2023 16:19:02 +0000
Date: Mon, 11 Dec 2023 08:19:02 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH 12/12] selftests/fpu: Allow building on other
 architectures
Message-ID: <ZXc2diNGXH8vaEZ8@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-13-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-13-samuel.holland@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 Dec 2023 16:31:45 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
