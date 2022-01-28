Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BE49F5AB
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jan 2022 09:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94B610F53B;
	Fri, 28 Jan 2022 08:53:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E8A10FAC2;
 Fri, 28 Jan 2022 07:08:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B291761B39;
 Fri, 28 Jan 2022 07:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EDFC340E0;
 Fri, 28 Jan 2022 07:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1643353728;
 bh=RwoGhw9V3nvnXM6f38F+V1PStwHO0x+5RXTTdAXp7JY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jsz1QO9E0ZfOdT9FgvWsZdDnsyje3cBIe9Sp+qpxxX4U4KTlhRY9LrCn0XUx3HaZP
 4WBX+6yG1a3ICbZ89FPVGOwdGh7lyOhl74FamB4CNioDPaMo5s1LstXIHuob98PHkc
 WBP4cFU5GkOpnhCpCtQ/L8gGFP+Xn6e+p2yM+w34=
Date: Thu, 27 Jan 2022 23:08:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Subject: Re: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Message-Id: <20220127230845.13a11680077ca5d4334de8f3@linux-foundation.org>
In-Reply-To: <6434ba24-a219-6a5a-d902-0b48974a0e43@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127143258.8da663659948ad1e6f0c0ea8@linux-foundation.org>
 <6434ba24-a219-6a5a-d902-0b48974a0e43@amd.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 28 Jan 2022 08:53:07 +0000
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 17:20:40 -0600 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com> wrote:

> Andrew,
> We're somehow new on this procedure. Are you referring to rebase this 
> patch series to
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> <5.17-rc1 tag>?

No, against current Linus mainline, please.
