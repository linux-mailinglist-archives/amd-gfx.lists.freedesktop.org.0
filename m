Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF023C45CE
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Jul 2021 09:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFD789B66;
	Mon, 12 Jul 2021 07:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0060.hostedemail.com
 [216.40.44.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EB889A5E;
 Sun, 11 Jul 2021 17:45:55 +0000 (UTC)
Received: from omf09.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 37FAE182CF66A;
 Sun, 11 Jul 2021 17:45:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id 7BF461E04D4; 
 Sun, 11 Jul 2021 17:45:50 +0000 (UTC)
Message-ID: <a8f75357ab3bd3b37269e51a38aafa997307570f.camel@perches.com>
Subject: Re: [PATCH] drm/amd/display: Fix identical code for different branches
From: Joe Perches <joe@perches.com>
To: Len Baker <len.baker@gmx.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Sun, 11 Jul 2021 10:45:48 -0700
In-Reply-To: <20210711172433.2777-1-len.baker@gmx.com>
References: <20210711172433.2777-1-len.baker@gmx.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 7BF461E04D4
X-Spam-Status: No, score=0.11
X-Stat-Signature: 7ma6bo74edffc1o15s1gyp3aqp9y57xd
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/HO52DK1P6z6FVcGIy7yHO2Mioju5SxhI=
X-HE-Tag: 1626025550-417702
X-Mailman-Approved-At: Mon, 12 Jul 2021 07:18:38 +0000
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
Cc: Martin Tsai <martin.tsai@amd.com>, Kees Cook <keescook@chromium.org>,
 Wenjing Liu <wenjing.liu@amd.com>, Yu-ting Shen <Yu-ting.Shen@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, George Shen <George.Shen@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, 2021-07-11 at 19:24 +0200, Len Baker wrote:
> The branches of the "if" statement are the same. So remove the
> unnecessary if and goto statements.
> =

> Addresses-Coverity-ID: 1456916 ("Identical code for different branches")
> Fixes: 4c283fdac08ab ("drm/amd/display: Add HDCP module")
> Signed-off-by: Len Baker <len.baker@gmx.com>

I'm not a big fan of this type of change.

It's currently the same style used for six tests in this function
and changing this last one would just make it harder to see the
code blocks as consistent.

I doubt any reasonable compiler would produce different objects.

> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b=
/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
[]
> @@ -305,10 +305,8 @@ static enum mod_hdcp_status wait_for_ready(struct mo=
d_hdcp *hdcp,
> =A0				hdcp, "bcaps_read"))
> =A0			goto out;
> =A0	}
> -	if (!mod_hdcp_execute_and_set(check_ksv_ready,
> -			&input->ready_check, &status,
> -			hdcp, "ready_check"))
> -		goto out;
> +	mod_hdcp_execute_and_set(check_ksv_ready, &input->ready_check, &status,
> +				 hdcp, "ready_check");
> =A0out:
> =A0	return status;
> =A0}
> --
> 2.25.1
> =



_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
