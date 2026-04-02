Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEhgOJxgzmnvnAYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Apr 2026 14:27:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91A389095
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Apr 2026 14:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E38A10F05E;
	Thu,  2 Apr 2026 12:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uYOthpD2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XXEixpdL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 550 seconds by postgrey-1.36 at gabe;
 Thu, 02 Apr 2026 07:11:02 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B103010EF9B
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Apr 2026 07:11:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fmXpQ4PsGz9tyH;
 Thu,  2 Apr 2026 09:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1775113310; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JD+qogYTEe5G3bMmgq5tsZPaYXL17CNBmjDXW042no0=;
 b=uYOthpD2xdg1352XJXlxgTgEykFloUJTdciEdzwGW8xF/FOk4mR6vVmkPSBO5b47OO6j6k
 MP183BOjq6gkz5XwwEFHL4DxpBabpAYrP8t+a3SREpu4XaFOZe3C6gNoGCcahCiDL0c+46
 gpWsb/n9mj3UFGUUrR68NBwTUc2EzmWDRcKj2uj9J7qnWmM9jCqaNCjSv58ob0vrA/8DvO
 +D4GPrJKCY90u3Q9bu8i1OVb0syQv+dyrhYUTge556WTyPo7ZQao+uzH12k85DocsFnXGv
 PkSetxz9wK5RuWWEmSE+EQZHtDE1BRHl4/9Z66x2nu/eKfLt+epod6HxYJZPqw==
Message-ID: <aea84d2eee808ba4c3eb462f1371b478f8e58ae6.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1775113308; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JD+qogYTEe5G3bMmgq5tsZPaYXL17CNBmjDXW042no0=;
 b=XXEixpdL/mFjugr5cOH09AY7Z9dJXIpH2MEHeV2rUo9+nVBPxYeP0dJV6C4yWSQ8hsV46F
 nbLylsDLyBy5bFY/cawoppVWfiwoxqOI0p1xfPzXTlpqPeszcVLAgzYKTY6hrqM6D1Ybgl
 zlLA6mj7VeyPhZIX8QEPkkI3hWkU9UjYpClrrCFRXcfk4aLKaRUNa3rx6l0ytHfRMZccCU
 xOh8+tzdell3Wm3xRalHgL8hBJr7sd5IMa2toYcbHW++c5G7zmBzNudONQfVmhizwZMr0r
 j65adUaTVqWED+lHwVu/EBcDcNnWFUw1TSKDobF6+i74qtALWGDzsmOyKVmRZQ==
Subject: Re: [PATCH v7 00/29] Fair(er) DRM scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: vitaly prosyak <vprosyak@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Leo Liu
 <Leo.Liu@amd.com>, Lucas Stach <l.stach@pengutronix.de>, Matthew Brost
 <matthew.brost@intel.com>,  Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>
Date: Thu, 02 Apr 2026 09:01:34 +0200
In-Reply-To: <9ed0f453-23ad-49c0-9ad9-c14f1999dba2@amd.com>
References: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
 <9ed0f453-23ad-49c0-9ad9-c14f1999dba2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ss85gsic9xj1yr1q6jt11wkgrsfsquc8
X-MBO-RS-ID: cd8a32e3f41d1c714c1
X-Mailman-Approved-At: Thu, 02 Apr 2026 12:27:01 +0000
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
Reply-To: phasta@kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vprosyak@amd.com,m:tvrtko.ursulin@igalia.com,m:dri-devel@lists.freedesktop.org,m:kernel-dev@igalia.com,m:intel-xe@lists.freedesktop.org,m:dakr@kernel.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:Leo.Liu@amd.com,m:l.stach@pengutronix.de,m:matthew.brost@intel.com,m:pierre-eric.pelloux-prayer@amd.com,m:michel.daenzer@mailbox.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 1B91A389095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 2026-04-01 at 16:01 -0400, vitaly prosyak wrote:
> Tested-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>=20
> Tested the 29-patch scheduler series on our CI; no issues were found.
>=20
> Thanks,
> Vitaly


Thank you very much, Vitaly =E2=80=93 greatly appreciated!


Philipp
