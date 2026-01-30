Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH8bAJcwf2k8lQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 01 Feb 2026 11:53:11 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925EC5AE3
	for <lists+amd-gfx@lfdr.de>; Sun, 01 Feb 2026 11:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909810E1A1;
	Sun,  1 Feb 2026 10:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DoCHiMNb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE6C10E50C
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Jan 2026 15:44:00 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f2gKS57jTz9tsw;
 Fri, 30 Jan 2026 16:43:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1769787836; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9jc31fseKGGRigF02PXlvqwdQBpimKARhl73C171eM=;
 b=DoCHiMNbRi0Eg1QLKXFAqRIV1Amj439D5+ENvZWI5iQe/qokP/Q5ACx1STJihOt0C80VTt
 LxnfHYBeh7SfM+nY1RgGan4Xh4OFsd5wP+XpFJAl6Cy4QJ3HcDbNnxI3oLEPOaCVq9iJot
 DwI+QcWm2eA8QO6x0o6uRsPeHN9Gt/Ro2JhEL6a8y1O0lrQOfuNwB5PR+zVgmv3Fa7jlVk
 wAPxJ+TeHDjK6q7WON/nYZiOn/dLgF3JGnoRkLmv/pTxAgJ5j0Eey2rZOnj7+LJKJWqwjG
 f6sytXCt+v/P0KD0vkLChxX7FsPhbGn7SAUkk7UjjDaLLp4botZ5GykP/p4Cvg==
Message-ID: <9b307a300bf7ece290339f78805b7ee0c1420dea.camel@mailbox.org>
Subject: Re: [PATCH 01/12] drm/amdgpu: re-add the bad job to the pending
 list for ring resets
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Philipp
 Stanner <phasta@kernel.org>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Date: Fri, 30 Jan 2026 16:43:54 +0100
In-Reply-To: <e8bbdbef-8d34-4465-9ad1-aead5e1f9361@amd.com>
References: <20260129203731.21506-1-alexander.deucher@amd.com>
 <20260129203731.21506-2-alexander.deucher@amd.com>
 <e8bbdbef-8d34-4465-9ad1-aead5e1f9361@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 19dbf17b4ea8baeef84
X-MBO-RS-META: 7r3qzjohkdoc85xxmwhdrbfqqndwgc78
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:52:53 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[43];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:phasta@kernel.org,m:jesse.zhang@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 7925EC5AE3
X-Rspamd-Action: no action

On Fri, 2026-01-30 at 16:30 +0100, Christian K=C3=B6nig wrote:
>=20
>=20
> On 1/29/26 21:37, Alex Deucher wrote:
> > Need to re-add the bad job to the pending list before we
> > restart the scheduler.
> >=20
> > Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0 | 6 ++++++
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 4 ----
> > =C2=A02 files changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_job.c
> > index aaf5477fcd7ac..9b10470321be3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -135,8 +135,14 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout=
(struct drm_sched_job *s_job)
> > =C2=A0	=C2=A0=C2=A0=C2=A0 ring->funcs->reset) {
> > =C2=A0		dev_err(adev->dev, "Starting %s ring reset\n",
> > =C2=A0			s_job->sched->name);
> > +		/* Stop the scheduler to prevent anybody else from touching the ring=
 buffer. */
> > +		drm_sched_wqueue_stop(&ring->sched);
> > =C2=A0		r =3D amdgpu_ring_reset(ring, job->vmid, job->hw_fence);
> > =C2=A0		if (!r) {
> > +			/* add the job back to the pending list */
> > +			list_add(&s_job->list, &s_job->sched->pending_list);
>=20
> This is explicitly forbidden by the scheduler maintainer.

Fun fact: In English they sometimes use our german word "verboten" :)

>=20
> So we seriously can't do that here.
>=20
> Correct approach would be to return the proper code to the scheduler so t=
hat the scheduler does that.

Yes.
Thank you very much, Christian.

Layering violations and ossification of API internals is one of the
main reasons that brought drm_sched to the brink of unmaintainability.
I think I was very explicit about this at XDC.

Our friends at AMD shall take Panfrost as an inspiration:
https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/gpu/drm/panfrost/=
panfrost_job.c#L760


P.

>=20
> Regards,
> Christian.
>=20
> > +			/* Start the scheduler again */
> > +			drm_sched_wqueue_start(&ring->sched);
> > =C2=A0			atomic_inc(&ring->adev->gpu_reset_counter);
> > =C2=A0			dev_err(adev->dev, "Ring %s reset succeeded\n",
> > =C2=A0				ring->sched.name);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ring.c
> > index b82357c657237..129ad51386535 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> > @@ -868,8 +868,6 @@ bool amdgpu_ring_sched_ready(struct amdgpu_ring *ri=
ng)
> > =C2=A0void amdgpu_ring_reset_helper_begin(struct amdgpu_ring *ring,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 struct amdgpu_fence *guilty_fence)
> > =C2=A0{
> > -	/* Stop the scheduler to prevent anybody else from touching the ring =
buffer. */
> > -	drm_sched_wqueue_stop(&ring->sched);
> > =C2=A0	/* back up the non-guilty commands */
> > =C2=A0	amdgpu_ring_backup_unprocessed_commands(ring, guilty_fence);
> > =C2=A0}
> > @@ -895,8 +893,6 @@ int amdgpu_ring_reset_helper_end(struct amdgpu_ring=
 *ring,
> > =C2=A0			amdgpu_ring_write(ring, ring->ring_backup[i]);
> > =C2=A0		amdgpu_ring_commit(ring);
> > =C2=A0	}
> > -	/* Start the scheduler again */
> > -	drm_sched_wqueue_start(&ring->sched);
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
>=20

