Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D8728F4F4
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Oct 2020 16:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3816ED2D;
	Thu, 15 Oct 2020 14:42:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from services.gouders.net (services.gouders.net [141.101.32.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932396EC41
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 08:12:00 +0000 (UTC)
Received: from localhost (ltea-047-066-024-155.pools.arcor-ip.net
 [47.66.24.155]) (authenticated bits=0)
 by services.gouders.net (8.14.8/8.14.8) with ESMTP id 09F89pPO010482
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK)
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 10:09:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
 t=1602749392; bh=2jmKQNUm/436TWB4NvnjprFNADxMgHSh0bDTmpb6Xv4=;
 h=From:To:Subject:Date;
 b=YfWPqZ99tlc4zqs6oEXH5b7NePVFGAwS3MJs9Q/3DDmF9gncU1odWFI/CiabvIlVe
 FgJc04EmkRIS2PxPpO0N5aI2v1a1iXvjppjd9noAlNuAQBkQlrSKq2Vgmkz+xrP72M
 3/zAxt7fC6SBKg9bP537F99PFjBjejNfYsujbjfA=
From: Dirk Gouders <dirk@gouders.net>
To: amd-gfx@lists.freedesktop.org
Subject: Renoir: visual artifacts associated with scrolling
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 15 Oct 2020 10:09:34 +0200
Message-ID: <ghblh3kj0h.fsf@gouders.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Oct 2020 14:42:41 +0000
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

I am dealing with visual artifacts on my laptop.

I'm not sure if screendumps are OK on this list so I will try to
describe the two vulnerable applications I identified so far.  Both of
them can be healed by forcing a full redraws (changing workspace back and
forth, minimizing and maximizing windows) when they misbehave:

        1) Xterm
           Using the mouse wheel is OK, SHIFT-PgUp and SHIFT-PgDn result
           in damaged lower and upper halves of the screen accordingly.

           This problem I could solve by using another terminal program.

        2) Emacs
           I see visual artifacts when navigating mails or source code,
           for example.  These artifacts are more versatile: sometimes a
           top line that seems to be pinned, remainders of long lines,
           sometimes pinned half lines where the top half of a text line
           and the bottom halfe seem to be a mixture of actually two.
           Sometimes these artifacts are only identifiable, because all
           of the displayed text makes no sense in context.

The predecessor of that laptop is Intel based and does not behave that
way.  Running the two applications on that Intel based laptop via ssh
from the Renoir machine shows the same problems, though.

Because the predecessor of the laptop does not cause these problems, I
tried to do a bisect but did not find a "good" candidate.  With all
kernels an X-server would start with (>v5.4) I see these artifacts.

Still, all this probably does not mean it is not user space that causes
the problems.  Perhaps, someone could give me some hints what else I
could do to further examine this problem.

Dirk

P.S: Scrolling this text up for review before sending it out also
     partially scrambles the text.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
