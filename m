Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJBxFclzlWnDRgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Feb 2026 09:09:45 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082ED153DE1
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Feb 2026 09:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846110E586;
	Wed, 18 Feb 2026 08:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLwGwah7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735DF10E515
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Feb 2026 16:41:04 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-65a1faf828bso529765a12.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Feb 2026 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771346463; x=1771951263; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=r/mWn0NTZppbdGJFnI/ErDwdANkgeIegPSZLoS1BE5U=;
 b=GLwGwah7+Erw7DnT1m6GR6nWA6GBTdGM9QFQxLSXpZHKqk9JY2tE7+fGjf0b1O0w0Q
 g08V4MkTajgiIE/LfWSnRx2oxbSygplypC5DmAnbQXJRP7+rkCDABbvgzMWZ6bPbbBc/
 FVUYJt/DVisbFlElXtlJA5bHocUZvNEn6wO600Z57se7foFO6OOIIRxCT/L4rEsGbmJe
 tugU0LHMobOL9fEPSRzzCmYe0obrXW7bMoULRwYEt3SbBZNjDudrSWoHJXkvYPGIXGOP
 jnFB5djkzw27u+HkAhfAgWRNyvZuZ4GnFj6H9dI66pfF6VBCc3L+m8vnvzJFzl+vHQWX
 PXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771346463; x=1771951263;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r/mWn0NTZppbdGJFnI/ErDwdANkgeIegPSZLoS1BE5U=;
 b=fzbeEEQ7V/tNn35F/Wcfw5wm+GY0IjpCVPBOnm5nyQ0rd8r5RWQPosDMPCg+cj8Y6Q
 6YwJ31r7FWaT0Rc9fAWD4plaiIQoUCQ13Go961CBoo092TwbOm240DvkCQDmZDhQskzA
 fUtGrcvhNGoW9xuPh/ce2NyJ7bmbWN7HIiMO0rsiOncNm7kOEt9urty+gJsBdaOMEkmb
 l7BNC5GpwYcprcl0/7ym5/NayHiXcov6PYwt50Il6pFAxzDzWr6CDap2/WCzHAopGP29
 0hKPzrkQU+qOzRKiexXN6pbDbNCZp1oSBE15v26M5vXw9gXPeVFkctpdh5LFd3bm0KNr
 s8UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1yvpxwuIon25WaUrY+seBJ+SmZUnNWw0FG/1J231fsJWaND5zuVY18RzWj8Xs9U49IYop5pCd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoQsJE/moFVWa/TXK5a9+SH6vvwxSjsMdSYiiUahDlokvx7r71
 905IEYS1IsAYKYhUKfGHtGbQbFtYUOVrJc1l7/npXDnRUgc+SeR8+l5F
X-Gm-Gg: AZuq6aL/Z4hRZ1IJOhSrNZDu4nnIhBLZ+/Sr7nqXgN+357OoSiLJ+L7n3k8kD/txGyq
 X6QaffGQCCzo9+tLJwwiXIHaACxChiIYiHJFEG+W9b9loO48ma+My2vOMHFTH/4Srgtyrdb+335
 PKzDeYC5uoZYJiGJfOkmE3qnQ+12bsVcczGaq2sMI0QzU0wUfZDE0f1OjZ9bha/1D1pqJSu64lP
 n/verBW+RUiJ1F/mDRdBdw6erbTT32eCOcXSr+JHulD6rDr41pk628nertLXsIlMtmW+C7T9ONs
 uYRhF+4u2Rjby7nOUXRJYICd25UMFMMB4o2L2UbE1RFvqpdLI4r/rxIoxBnT//T36aT2EKwM2Y7
 NOwHXhk1o3Lgb/AeStZ+MoOLKQLUvErag2tSGe7grZ7PG3ieuwuFKu+BvkOPkD0iU5bWJpdsi6y
 qfsZ6uZs+onX6bPCqyKIxfq5csoMoQEH7Z4eq7p9duOKQ0xq6/GfnyROUsHp+Xi3IHMfF1AhH4a
 Xp9USDJwyo=
X-Received: by 2002:a05:6402:5244:b0:65b:a76d:6ff6 with SMTP id
 4fb4d7f45d1cf-65bad140f57mr4283834a12.3.1771346462611; 
 Tue, 17 Feb 2026 08:41:02 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3f1294sm2511183a12.26.2026.02.17.08.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 08:41:02 -0800 (PST)
Message-ID: <8006baea7c35850de3a39f155b7aa004c4896495.camel@gmail.com>
Subject: Re: [PATCH v4 23/27] drm: Add passive_vrr_disabled property to crtc
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, 
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, daniel@fooishbar.org
Date: Tue, 17 Feb 2026 17:41:00 +0100
In-Reply-To: <c6a852ae-4edf-4336-9f2a-448c296cc045@mailbox.org>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
 <20260216164516.36803-24-tomasz.pakula.oficjalny@gmail.com>
 <c6a852ae-4edf-4336-9f2a-448c296cc045@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Feb 2026 08:09:39 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:daniel@fooishbar.org,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,fooishbar.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 082ED153DE1
X-Rspamd-Action: no action

On Tue, 2026-02-17 at 09:21 +0100, Michel D=C3=A4nzer wrote:
> On 2/16/26 17:45, Tomasz Paku=C5=82a wrote:
> > Many TVs and other HDMI sinks suffer from blanking and possibly other
> > glitches when VRR is toggled. With VRR present on such sinks and
> > vrr_on_desktop enabled, they behave like the signal is always variable,
> > even in fixed refresh rate situations. DisplayPort and eDP enforce
> > seamless VRR transitions but HDMI unfortunately doesn't.
> >=20
> > Keep VRR toggled if it's supported and not explicitly disabled. It can
> > be used for any VRR sinks, but this is mainly targeted for HDMI.
> >=20
> > Functionally, for an end user, this is the same as normal, fixed refres=
h
> > rate mode. The only difference is that sink is kept in VRR state which
> > enables seamless transitions into/out of variable refresh rate.
> >=20
> > Basically, the driver shouldn't change it's behavior around VRR_ENABLED
> > set to false, jut keep sending info packets/frames with VRR/FreeSync/
> > G-Sync/HDMI VRR active.
> >=20
> > Enabled by default for sinks that claim it's support
>=20
> Having a negation term like "disabled" in the property name can be confus=
ing (as it involves double negation when the property value is 0) and is be=
tter avoided.
>=20

I understand that and felt a little cheaty by doing this but I couldn't
for the life of my figure out how to make it so a driver could override
this by default, before the compositor will set this. Would a "set"
function work, just like for "capable" properties?
=20
I 100% believe this "Passive VRR" for HDMI should be the default and
helps massively but I'm not even that convinced if this must be user
configurable. Alex asked to make it a property, but In the end, it's not
something thsdat can be controlled on other OSes. I still believe that
users should be able to change this somehow, but if amdgpu module
setting wasn't a good fit, I don't know what is.

In the end, I can just yeet all this completely and hardcode
freesync_on_desktop =3D true for HDMI like it's done in the windows
driver.
