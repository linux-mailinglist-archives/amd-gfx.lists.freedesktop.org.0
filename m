Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OS3OSlpvmmTOwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2026 10:47:21 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967492E47BD
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2026 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4917910E36B;
	Sat, 21 Mar 2026 09:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZW7ipYjC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A111F10EA74
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 17:52:47 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-64c9ebd1369so2286171d50.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 10:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774029167; cv=none;
 d=google.com; s=arc-20240605;
 b=P0JJApasckqv63rKTco/UYlue0GBiWs/zQjarN4n39+8aHtXqlksM6n9Syc0Unhu4G
 0R1hoSjkx9xFZ6MmARdfoTWrcmVVS6UTXMVAlAF6wnZok+8OaQGFgTSUZt8zMzxKVRR6
 05lBF43FE7zcHgSRZvBxl+52JRbUEECe0HqJuEfZssRq8u4pNEQ9D5Rby5VNTJqs7IdB
 uNwsiJMlL2fDlYa8I8Y//B42WFDIXjGQm/q1wVC4n4kbJGhd77WLfwXNwGfZaF3XeJ4A
 s68sOkkLMGJrJ7fGDoHlfBlkoE076hJqgstmvJPZLjZZuAcXe0s+KB//jVsarNEZ1GC9
 eOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jzqKUayHP9edpbuU79uv3nBiFh6UCYpOtYrxmChIqeY=;
 fh=9VoU3w/lMOntDK4LRxSZCpGbahw0+WfzufxHIbIO1sY=;
 b=L+dUGyLF1dTuCdgFhO0lCqDY8sel711Wtv3esUTr0E5xu57IBBdsD2dSHSwZ2k4i3r
 A/eHRJ/0I4awX69dRoGkauCR1QqrP43wgJjzUShgvTQma6fEtsoPoyfctV4cecs83nXd
 +iGG1ULzJ3JpqeVT5/Lj+409mPB/xo3IE6YyJNP1z4L9OSa0/zkjnZ+1NcQC/gHBTvjn
 aOVJsl7Zu2+mP4Hxvfj0dvuiJ1Yx/E15Pgo53VWGGt2ygiZgIFAJvjWoPbV35kJNVFTp
 VtUxwl2dwroDftqotj209XMXbk1B8sAi1tIhdwexyU6L0MW9ECl7Wu9hEKEd6oxdJeRx
 Lhcw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774029167; x=1774633967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzqKUayHP9edpbuU79uv3nBiFh6UCYpOtYrxmChIqeY=;
 b=ZW7ipYjC+vyFBTKUCqFZxZtXbDvuUldJlw4g3RYF8ihj0FemZ2E1RenqNuchTzmRL8
 kjPTGmWf3Dl6qS9fczrRaW7YuhR1bk6N0xhg6cFeCE+gxpE4RfObNrxS+h1ueppUamPV
 WhtyAzTpVZI/XcSfyUwp8Z74utFaFc+5K0Qh7eYrFomClJGA5J/uLiR50pwigmH2qdpv
 QgBkezSzLCUdsqKLY3Nh3nzTCdAmlTyp9OxKbD+UKWTZ9PHQS3vhQQxpHWRU8y3fJDT3
 oALYIIv8GdmUAy4f4lG0zo42QnVxSo7DhIEOTZ/ZUSdWvgXVpWgzwz0brb3m7Z80SetF
 TWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774029167; x=1774633967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jzqKUayHP9edpbuU79uv3nBiFh6UCYpOtYrxmChIqeY=;
 b=QXb6dIlsAfOxdHnUNcHlLWkiWo9noAfFRmIf3YrMj9Wi6NGCyOctsJL8pN1zyljXph
 bh4pnZ0xgFJktOgkvHH5GcjfJfH4c5dp6+gq9KIkpf1xsd/4R4AGZ/Sfz3SEfuwyqVR0
 c34SwbAYhtRWBSr+kUN4Z8lVb/zEo7m4wdrw1VtbW1pGmxV8E7tHDqg3ltxVlfbocwwV
 3eb4sBfLYVC6uMnPb+PtfWP988DiP6xW9QGCvdoRozvYTyDAbwkPnzsmY1KVqPaD1O9m
 MnUTQFw59pMRT7Y9dcPM57eNtKt4/wl1J1LexwedmuvR4Y4KhUG5dJfcziqbKpjrZXiu
 D6rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnBDXoYsmx6c6213p1Q1HgHvF4NbOq/gVd3Z0Nfz7nf2k1cBzf+CL9HxnAnbFjTGSTWi2FPcH8@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8K1j3z4dQuE47O1EJGVr2Z6MbMaTJiqXOmmmC6YzX8ggiVd7H
 y05lfM0zQPDx6fmRBl6az6NDlmEiURXLXZwwic3s6PM4C4WsCA5thLybk2K4/51i5ru+ZkV2QIs
 xGSMUfApIztiWVWTEA8TdKN3yMHKaEcA=
X-Gm-Gg: ATEYQzzI7iLRdpJ+MaLnUWZtIV97rNeVFjAfW1oyLVubAISdgMIBiA650ZqdLPRdjoV
 uiBe3Am91c8HV+UECVjLivrOX6Z02vrnN3LaowK1WgetROoTWJf5cr2K89RyGV6PZTVdjQ8Ei11
 P+39efUY5vitynkaevkdjpCsRHXBFfROK4lxD8xdxavlu/A8ESUwWEWtcT2CaokNVlz5zUaIPDa
 eZ2dsvDgSp7mc1Kx7yYtSBkRMPYdxVZi6eueBWtB6r85OGz9PniyCxTQx2da7iiR0uYIs9YOCRl
 AIsO
X-Received: by 2002:a05:690e:e83:b0:64e:a9a1:fdb9 with SMTP id
 956f58d0204a3-64eaa702c33mr4585474d50.34.1774029166611; Fri, 20 Mar 2026
 10:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
 <20260313132103.2529746-25-jim.cromie@gmail.com>
 <177402491443.6181.60919381684088042.b4-review@b4>
In-Reply-To: <177402491443.6181.60919381684088042.b4-review@b4>
From: jim.cromie@gmail.com
Date: Fri, 20 Mar 2026 11:52:19 -0600
X-Gm-Features: AaiRm530GL692oa9s3DUJ1CJBDaPg95JNvy-jkTucGT5VXQChAM653FPkofN1SA
Message-ID: <CAJfuBxysWdtEQAd6X35vMGhDA22Woyd28OzQF1nRW8+j8oOGXQ@mail.gmail.com>
Subject: Re: [PATCH v11 24/65] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE
 args at compile-time
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, mripard@kernel.org, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, christian.koenig@amd.com, 
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com, 
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 21 Mar 2026 09:47:17 +0000
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,suse.com,chromium.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 967492E47BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 10:42=E2=80=AFAM Louis Chauvet
<louis.chauvet@bootlin.com> wrote:
>
> On Fri, 13 Mar 2026 07:19:49 -0600, Jim Cromie <jim.cromie@gmail.com> wro=
te:
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 1ba4be9a403a..b2bdfdfb6ba1 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, =
D2_CORE + 1, "D3_CORE");
> > [ ... skip 4 lines ... ]
> > +/*
> > + * Exersize compile-time arg-checks in DYNAMIC_DEBUG_CLASSMAP_DEFINE.
> > + * These will break compilation.
> > + */
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG=
");
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG"=
);
>
> Maybe add a:
>
> DYNAMIC_DEBUG_CLASSMAP_DEFINE(cat_disjoint_bits, 0, 61, "TOOLONG");
>
> So you can also check that an overflow is really checked.
>

IIUC, you want a class that has legal offset, but extends past 63 ?
If so, I think I can add / test that.



> --
> Louis Chauvet <louis.chauvet@bootlin.com>
