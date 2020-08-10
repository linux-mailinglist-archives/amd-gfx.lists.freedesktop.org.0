Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C0240AD5
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Aug 2020 17:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E014489FCE;
	Mon, 10 Aug 2020 15:53:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F81289FCE
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 15:53:31 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C7263ADD;
 Mon, 10 Aug 2020 11:53:28 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 10 Aug 2020 11:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm1; bh=4tHZFyeA72S9jJUf22PurABmxWM7
 Gs6M8zvxYihgZIU=; b=oN8KihT3RmRQocJnKpa2Lrq3yc0lUhNPHEgOif4JL1Po
 XtEJbeWD8GM/N1H68H0M6HYeM0LlWRr9ZLKjb1+qBlxOMYIM96IPlUHO2ZiB+u6V
 F8XZl8l8ZoTkk0pLg2clyZ/l9YkvINIw+PGSZh621yxKjwvQjePu2nUdNm6aRB+l
 anb6lbndLYjwyvflXhX99Z4eYy4v0XUM8d5U1UYavPkVdnOCOVs4qzPYJxCUx1p7
 yhbjvPF6oBSyY11x3KE5fZRVe/ZeyEzqMgu6ggn0HDEQjxL8HIdG0WGOePfHsA9i
 oW7RBtgkFkm5KbcobApt/fBNK/HkZJdV1vua2UI+IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4tHZFy
 eA72S9jJUf22PurABmxWM7Gs6M8zvxYihgZIU=; b=IGjJXvmHb+YlzkFga98YDw
 rKTIWKUpxMqyD76V0M8K0+lQKy8Smvf33XkFODQBxyixYRUA4fnJENlGYGxvo7T1
 dKXUr66gaorL92dAfuCpC4wgmfsC/MP4l50qqIwdWgrtnB6p2EG+6AoLU0+dOdg1
 Z6xYP4EqDAt7xRH9MJo5ubd1AvxNUhzNPzNxhVOUE+7QtbSPZ0jCwKpB/xesqoFc
 3MbZQtmYutN1TvUgBuhSAC22UvHy0fd//hbwUiwjNos36YavXC8TqlD711j5Ix6d
 7Gp6TsSanwFf0glPEGN+CZmdFtwZqJAcKrgDwVpbNMpZAckqPPdAH9zSJ3uNQ9zw
 ==
X-ME-Sender: <xms:eG0xXxrqozbk-90L3EZf3ZIdIGlTqswubnjlFzWLsCIq1qXkRY_AVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrkeekgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfffgrnhhi
 vghlucfmohhlvghsrgdfuceouggrnhhivghlsehotghtrghfohhrghgvrdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefgveekveefveeiveekkefhieelhfffffdujefgjefgieeufeek
 leejieeigfeiieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnihgvlhes
 ohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:eG0xXzolDCxddK_LGkQ2TzncebupTKt8IhjSPH48xLGts6nn_Vv4jQ>
 <xmx:eG0xX-NNdj8kPWIBqxh2D25cj-QSUJadzwQsG0bMuQCS10ZvaiFRjw>
 <xmx:eG0xX86HgDsaOfst0ofT9TDKpAb8gWA3UFOYVOQ2e6Z7IVDGS9wylA>
 <xmx:eG0xXyG-mWEdWOIvWDWNaQ3f8bGCTbKMT2bjUE_xKv_QP3FFb87-5w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 11FD5C200A6; Mon, 10 Aug 2020 11:53:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-143-g3d58b38-fm-20200806.002-g3d58b387
Mime-Version: 1.0
Message-Id: <e899ee03-a37f-4558-afed-e6bd07ce97db@www.fastmail.com>
In-Reply-To: <CADnq5_P4fH0Bt6YcAy+msbeodhEts4knumsJxnGbgFXC+NojSA@mail.gmail.com>
References: <20200808204235.12313-1-daniel@octaforge.org>
 <20200808204235.12313-2-daniel@octaforge.org>
 <CADnq5_P4fH0Bt6YcAy+msbeodhEts4knumsJxnGbgFXC+NojSA@mail.gmail.com>
Date: Mon, 10 Aug 2020 17:53:07 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Alex Deucher" <alexdeucher@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH_1/1]_drm/amdgpu/display:_use_GFP=5FATOMIC_in_dcn20=5F?=
 =?UTF-8?Q?validate=5Fbandwidth=5Finternal?=
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020, at 17:38, Alex Deucher wrote:
> On Sat, Aug 8, 2020 at 4:51 PM Daniel Kolesa <daniel@octaforge.org> wrote:
> >
> > GFP_KERNEL may and will sleep, and this is being executed in
> > a non-preemptible context; this will mess things up since it's
> > called inbetween DC_FP_START/END, and rescheduling will result
> > in the DC_FP_END later being called in a different context (or
> > just crashing if any floating point/vector registers/instructions
> > are used after the call is resumed in a different context).
> >
> > Signed-off-by: Daniel Kolesa <daniel@octaforge.org>
> 
> We should probably find a way to pre-allocate this, but in the
> meantime, I'll apply the patch.

Indeed. But this should work as an immediate solution for people experiencing issues. For me it completely stopped dmesg noise on ppc64le and aarch64, and seemingly even fixed the screen flicker problem on POWER that I had to formerly work around by forcing the clocks to high (been running it for days and it's worked perfectly fine with adaptive during the time).

Daniel

> 
> Thanks!
> 
> Alex
> 
> 
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > index 991eddd10952..c31d1f30e505 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > @@ -3141,7 +3141,7 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
> >         int vlevel = 0;
> >         int pipe_split_from[MAX_PIPES];
> >         int pipe_cnt = 0;
> > -       display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
> > +       display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
> >         DC_LOGGER_INIT(dc->ctx->logger);
> >
> >         BW_VAL_TRACE_COUNT();
> > --
> > 2.28.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
