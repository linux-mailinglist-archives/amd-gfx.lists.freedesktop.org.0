Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD9pGYw0HWpZWQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:28:12 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7C61AE0A
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E65112EF8;
	Mon,  1 Jun 2026 07:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=poczta.fm header.i=@poczta.fm header.b="yssDv48P";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7303D10E60F
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 May 2026 10:52:30 +0000 (UTC)
Received: from Stacjonarny (62-133-144-026.dynamicip.ostnet.pl [62.133.144.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by www.poczta.fm (INTERIA.PL) with ESMTPSA;
 Sun, 31 May 2026 12:52:26 +0200 (CEST)
From: "Artur Chlebek" <achlebek@poczta.fm>
To: <amd-gfx@lists.freedesktop.org>
Cc: <regressions@lists.linux.dev>,
	<stable@vger.kernel.org>
References: 
In-Reply-To: 
Subject: 7.0.9 vs 7.0.10/7.1 Radeon 260X regression
Date: Sun, 31 May 2026 12:52:30 +0200
Message-ID: <002901dcf0eb$9472e210$bd58a630$@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKsb98F3W6w4/I7L4gnl9a4wKSh5rSI9UcA
Content-Language: pl
X-IPL-Priority-Group: 0-0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
 t=1780224748; bh=23Hr6bVV2eGzZD4V9CAprmCqyNkeGDWQ61jdUyLqKXA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=yssDv48Pev+PIQ+2CWFB85IQ+Bh6vUyB6EcyUY2JsblfJOKTNoUR7JLfmAhe6gNC4
 dqvPb+ENrbHGkxt0B+x00HJ4DMy/YsPADm3FfDuKs0HmsHKhSqJllvi8Tlu5OG7HTU
 s0rGTY07+HRX9nBmszgqidtRxpebVUdIXJG4X9fU=
X-Mailman-Approved-At: Mon, 01 Jun 2026 07:27:37 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[poczta.fm,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[poczta.fm:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[poczta.fm];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[poczta.fm:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[achlebek@poczta.fm,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[poczta.fm:mid,poczta.fm:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 19F7C61AE0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, I have 5x fps drop on amdgpu Radeon 260X 1GB between kernel 7.0.9 and
7.0.10 or 7.1rc

Original sparse mail got flagged as spam so let me elaborate:
Newest vanilla Fedora with Plasma, Gigabyte GA-H97-D3H, looked into things
like clocks, PM, ASPM, tried flags, GTTSIZE, .dc=0 - all seems fine nothing
helps.

Regards.

