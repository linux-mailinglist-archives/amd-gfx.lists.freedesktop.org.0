Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E892A11B3C
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jan 2025 08:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B45D10E4E8;
	Wed, 15 Jan 2025 07:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="ll42RC+k";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch
 [79.135.106.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524110E4E6
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2025 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1736927290; x=1737186490;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=ll42RC+ksYZq2Nh4RQ+KQfHDlEQyZpRu7XttVotsyXyqw4eo7TtoUm/OJMa3dlBnB
 xFwt98BB5qTUsPtyEjCbwfWG/q/hRMZpgGC8r2t+q8kGmKg7QPmky/eermqcTL9CDy
 7EGqyj48rXOfmpe14y8Ksb6QQcpIgmgnhfOdYgPm5uxSGA/8EUbGjUXNXIGbmi2YGK
 oceqAsm/JfzHAUXpz/Bnmp62MYpzGvUbEMUqV30/o+OmmAEXWVuUCd4eJiBBAbG0mZ
 oMksQJt2CrFVE5dh6wdG0wx9ztPRM5k5yg4gtuBRpN62VxeQE43yLATeMU/wAHQS3/
 XCutZtRaoWDYw==
Date: Wed, 15 Jan 2025 07:48:05 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 22/45] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Message-ID: <drEh59KcXyzvxNqtuglIyUDfoTOccIXX8krbikTRq2WywGShfP1oTamQTT3NBZJ0wx7tJJzET-Q_eGv149OVo52_q5XnFKOj_u9_2n_3Kf8=@emersion.fr>
In-Reply-To: <20241220043410.416867-23-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-23-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 1c8a6ba182f0bbec58a78427fa616c029a100036
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
