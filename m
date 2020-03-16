Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4B18737A
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2020 20:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302E66E4C7;
	Mon, 16 Mar 2020 19:35:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509A46E214;
 Mon, 16 Mar 2020 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mCPVZu9Y0wI9P/gu6FWuMiisXEan/deVgoJ1QqH1xfI=; b=gEHRVS7/1IB1I1Bcqu60/ysHwQ
 hu8vocPqQs6HMaM/YrXs8t5bDUIpRWD04Vy9VaLMHmpkBkSdPfZQK4wQmFMkpRoS1eaRJoWJbbO3t
 BP4lQpXVqQzaU4hOe6DccRInDc1AQpGM0WNzaRtUq0nV5kY4TanXjO2iDWBBBcrOz9keFeyhhw8U8
 CQ8ZJKhtZ886ACZaAa9kpoBgNZJTkLTXRoqTcYWK+GlPFTcaRE/qfqZmlCdLw046fkbPE8FePEG9s
 Vc11Su5XoJs+Jzt4PfNYDOv/lJu67ed5nNHyl2MuELPRjNpEYY95rFP0Gt6TXiO+Z+dbEd+YNMh8F
 ARvDfViA==;
Received: from [2001:4bb8:188:30cd:8026:d98c:a056:3e33] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDvTG-0003b4-7H; Mon, 16 Mar 2020 19:32:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Subject: ensure device private pages have an owner v2
Date: Mon, 16 Mar 2020 20:32:12 +0100
Message-Id: <20200316193216.920734-1-hch@lst.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 16 Mar 2020 19:35:56 +0000
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
Cc: kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

When acting on device private mappings a driver needs to know if the
device (or other entity in case of kvmppc) actually owns this private
mapping.  This series adds an owner field and converts the migrate_vma
code over to check it.  I looked into doing the same for
hmm_range_fault, but as far as I can tell that code has never been
wired up to actually work for device private memory, so instead of
trying to fix some unused code the second patch just remove the code.
We can add it back once we have a working and fully tested code, and
then should pass the expected owner in the hmm_range structure.

Changes since v1:
 - split out the pgmap->owner addition into a separate patch
 - check pgmap->owner is set for device private mappings
 - rename the dev_private_owner field in struct migrate_vma to src_owner
 - refuse to migrate private pages if src_owner is not set
 - keep the non-fault device private handling in hmm_range_fault
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
