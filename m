Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D1D2D9118
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Dec 2020 00:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2723E89B69;
	Sun, 13 Dec 2020 23:05:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from spam.moreofthesa.me.uk (moreofthesa.me.uk
 [IPv6:2001:8b0:897:1651::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FD689B69
 for <amd-gfx@lists.freedesktop.org>; Sun, 13 Dec 2020 23:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=moreofthesa.me.uk; s=201708; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=69q85NAJ4+Ej03WBnUBmeR2XUjHW4RwxaIKahLCQ7ks=; b=keQpirE4LNuFHa3rl15TJwuBr
 /IIes6SykNDoEaW4b9nn16qyXGq52UBel0s3vO0ZA/3C27VFh+Vv+KS+CRQ82IFG1WlTLvw5QAOgD
 DcLPrIwScaKW5cJmN6Wrw9TpVdzGxtv5Aj2R7NoK2Zt+CRlpO+/i8ojiiSnQ+QmPVa6hV/XcbyHrM
 nLiyftAa95ixvAqRkF3rtMSmVIp1x74oHntAiIdXKd5e9huOjQdqvCjwBRis5LJRHhJxJDAUIBp7l
 K2Pzq5aAVFSdKVpVc7072i+2NeVCsecptJHAk5JCnU3SoZMtMYGhG3Dqgbq7iQckU+R0mz+rvRcek
 qB7gtoM6Q==;
Received: from [2001:8b0:897:1650::2]
 by spam.moreofthesa.me.uk with esmtp (Exim 4.92)
 (envelope-from <devspam@moreofthesa.me.uk>) id 1koaQa-0004Xl-Hv
 for amd-gfx@lists.freedesktop.org; Sun, 13 Dec 2020 23:05:20 +0000
Date: Sun, 13 Dec 2020 23:02:51 +0000
From: Darren Salt <devspam@moreofthesa.me.uk>
To: amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/8] amdgpu, pci: improved BAR resizing support
Message-ID: <58E3DD34FC%devspam@moreofthesa.me.uk>
In-Reply-To: <20201213225323.6752-1-devspam@moreofthesa.me.uk>
References: <20201213225323.6752-1-devspam@moreofthesa.me.uk>
Mail-Followup-To: amd-gfx@lists.freedesktop.org, Darren Salt 
 <devspam@moreofthesa.me.uk>
User-Agent: Messenger-Pro/2.73.6.4250 (Qt/5.11.3) (Linux-x86_64)
X-No-Archive: no
X-Orwell-Date: Sun, 13162 Dec 1984 23:02:51 +0000
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:8b0:897:1650::2
X-SA-Exim-Mail-From: devspam@moreofthesa.me.uk
X-SA-Exim-Scanned: No (on spam.moreofthesa.me.uk);
 SAEximRunCond expanded to false
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

I forgot the Signed-Off-By for some patches. So, for all in this series:

    Signed-Off-By: Darren Salt <devspam@moreofthesa.me.uk>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
