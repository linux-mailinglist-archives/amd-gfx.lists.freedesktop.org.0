Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C1199D05
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2020 19:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6659C6E34A;
	Tue, 31 Mar 2020 17:37:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FA76E204
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 Mar 2020 17:37:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t8so99342wmi.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 Mar 2020 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W6cEKSG+iqx95WydQIvcDC6UsL7QelbPnpEDq7WGbD0=;
 b=Y3yISmnTJL3k4RYUKNAczvj4YjaP01v2vOEZyzIDW5nwUiLgHOQpkbDfar1dy2Mry5
 m5OAmtAq5/v5qr92nT82CePZ82FKs1stW7xnQzG/37WeDC0cmTpcXI5d9p9S9dqNNBBr
 6wsIfrEAoZIA9V2UFR7iLstDA4BQrW88j7QEsDppzQwYs13KPNcj3dC+CK+GNkPw4yUQ
 Pil+4wi5yjBjOW3GupAxIB5f/HTBa26O/gXAZxy5O6TI9spue31PadWZBtXiv/UpgPg3
 mPB3ZO7O+Ejl+mOpyXy9zcTSwJmarkOc4ku9UpDS9Si7e8f+qLNf71JfSZh2V7F3/C/6
 B/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W6cEKSG+iqx95WydQIvcDC6UsL7QelbPnpEDq7WGbD0=;
 b=cb6Rd3Z8HjfmzEDYE3AYXlES4M+4O36c4lIWa9fJc8RIorYa9DI8g0ARRpTLnSO3T+
 q3vVdOZ2fST/g6zwcqyrrxfuAE1wcnOxwj3fyAz39PJPyo/utONGckWV6pjBBygrC4th
 Aq7ubxPGvv0YBUg83GPiIYx5z7TJvjnj+b8IOUQpF48dyJ1IQ1t/9q/8sbH34JQE4O2S
 87WqiUFCiyVv5cT4UgFPauZp0e0C49kbv2y7it7VdzLr9N3MYIk1G82Z9c5BJKTPA64B
 LEk14uJyfzf3c0XpOov1xz6A4v7eeILfCZ/Yupq9HcRS68+6Ie1HZzokQzRR6HxWRXPz
 JaXg==
X-Gm-Message-State: ANhLgQ1CNXTjlohw+nXm/afASA/7J8eu7pNPX/FmmwZSQknEk0nWri7G
 7B6aD75CjUcs8r8hZFLFFs80u999/RG+s+7Eg1U=
X-Google-Smtp-Source: ADFU+vseQ1jKtySu3eXxahMBb4ChxitshlOigEb7b9LN4txYwdAzOk5R5M/678wl/sVgQnNwrolqoBKEgaEcqTRj6rQ=
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr4506667wmb.39.1585676272398; 
 Tue, 31 Mar 2020 10:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200330223616.28062-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20200330223616.28062-1-Bhawanpreet.Lakha@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Mar 2020 13:37:40 -0400
Message-ID: <CADnq5_NM=K0FN7qPE166-11kLQbc9cdDKYE6RJH1BhfqooDsHw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Guard calls to hdcp_ta and dtm_ta
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 6:36 PM Bhawanpreet Lakha
<Bhawanpreet.Lakha@amd.com> wrote:
>
> [Why]
> The buffer used when calling psp is a shared buffer. If we have multiple calls
> at the same time we can overwrite the buffer.
>
> [How]
> Add mutex to guard the shared buffer.
>
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |   2 +
>  .../drm/amd/display/modules/hdcp/hdcp_psp.c   | 420 +++++++++++-------
>  3 files changed, 257 insertions(+), 167 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index dbaeffc4431e..9d587bc27663 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -888,6 +888,7 @@ static int psp_hdcp_load(struct psp_context *psp)
>         if (!ret) {
>                 psp->hdcp_context.hdcp_initialized = true;
>                 psp->hdcp_context.session_id = cmd->resp.session_id;
> +               mutex_init(&psp->hdcp_context.mutex);
>         }
>
>         kfree(cmd);
> @@ -1033,6 +1034,7 @@ static int psp_dtm_load(struct psp_context *psp)
>         if (!ret) {
>                 psp->dtm_context.dtm_initialized = true;
>                 psp->dtm_context.session_id = cmd->resp.session_id;
> +               mutex_init(&psp->dtm_context.mutex);
>         }
>
>         kfree(cmd);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> index 297435c0c7c1..6a717fd5efc7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> @@ -161,6 +161,7 @@ struct psp_hdcp_context {
>         struct amdgpu_bo        *hdcp_shared_bo;
>         uint64_t                hdcp_shared_mc_addr;
>         void                    *hdcp_shared_buf;
> +       struct mutex            mutex;
>  };
>
>  struct psp_dtm_context {
> @@ -169,6 +170,7 @@ struct psp_dtm_context {
>         struct amdgpu_bo        *dtm_shared_bo;
>         uint64_t                dtm_shared_mc_addr;
>         void                    *dtm_shared_buf;
> +       struct mutex            mutex;
>  };
>
>  #define MEM_TRAIN_SYSTEM_SIGNATURE             0x54534942
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> index c2929815c3ee..aa147e171557 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> @@ -51,12 +51,15 @@ enum mod_hdcp_status mod_hdcp_remove_display_from_topology(
>         struct ta_dtm_shared_memory *dtm_cmd;
>         struct mod_hdcp_display *display =
>                         get_active_display_at_index(hdcp, index);
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
>         dtm_cmd = (struct ta_dtm_shared_memory *)psp->dtm_context.dtm_shared_buf;
>
>         if (!display || !is_display_added(display))
>                 return MOD_HDCP_STATUS_DISPLAY_NOT_FOUND;
>
> +       mutex_lock(&psp->dtm_context.mutex);
> +
>         memset(dtm_cmd, 0, sizeof(struct ta_dtm_shared_memory));
>
>         dtm_cmd->cmd_id = TA_DTM_COMMAND__TOPOLOGY_UPDATE_V2;
> @@ -66,14 +69,15 @@ enum mod_hdcp_status mod_hdcp_remove_display_from_topology(
>
>         psp_dtm_invoke(psp, dtm_cmd->cmd_id);
>
> -       if (dtm_cmd->dtm_status != TA_DTM_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_UPDATE_TOPOLOGY_FAILURE;
> +       if (dtm_cmd->dtm_status != TA_DTM_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_UPDATE_TOPOLOGY_FAILURE;
> +       } else {
> +               display->state = MOD_HDCP_DISPLAY_ACTIVE;
> +               HDCP_TOP_REMOVE_DISPLAY_TRACE(hdcp, display->index);
> +       }
>
> -       display->state = MOD_HDCP_DISPLAY_ACTIVE;
> -       HDCP_TOP_REMOVE_DISPLAY_TRACE(hdcp, display->index);
> -
> -       return MOD_HDCP_STATUS_SUCCESS;
> -
> +       mutex_unlock(&psp->dtm_context.mutex);
> +       return status;
>  }
>  enum mod_hdcp_status mod_hdcp_add_display_to_topology(struct mod_hdcp *hdcp,
>                                                       uint8_t index)
> @@ -83,6 +87,7 @@ enum mod_hdcp_status mod_hdcp_add_display_to_topology(struct mod_hdcp *hdcp,
>         struct mod_hdcp_display *display =
>                         get_active_display_at_index(hdcp, index);
>         struct mod_hdcp_link *link = &hdcp->connection.link;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
>         if (!psp->dtm_context.dtm_initialized) {
>                 DRM_ERROR("Failed to add display topology, DTM TA is not initialized.");
> @@ -94,6 +99,7 @@ enum mod_hdcp_status mod_hdcp_add_display_to_topology(struct mod_hdcp *hdcp,
>
>         dtm_cmd = (struct ta_dtm_shared_memory *)psp->dtm_context.dtm_shared_buf;
>
> +       mutex_lock(&psp->dtm_context.mutex);
>         memset(dtm_cmd, 0, sizeof(struct ta_dtm_shared_memory));
>
>         dtm_cmd->cmd_id = TA_DTM_COMMAND__TOPOLOGY_UPDATE_V2;
> @@ -113,13 +119,15 @@ enum mod_hdcp_status mod_hdcp_add_display_to_topology(struct mod_hdcp *hdcp,
>
>         psp_dtm_invoke(psp, dtm_cmd->cmd_id);
>
> -       if (dtm_cmd->dtm_status != TA_DTM_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_UPDATE_TOPOLOGY_FAILURE;
> -
> -       display->state = MOD_HDCP_DISPLAY_ACTIVE_AND_ADDED;
> -       HDCP_TOP_ADD_DISPLAY_TRACE(hdcp, display->index);
> +       if (dtm_cmd->dtm_status != TA_DTM_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_UPDATE_TOPOLOGY_FAILURE;
> +       } else {
> +               display->state = MOD_HDCP_DISPLAY_ACTIVE_AND_ADDED;
> +               HDCP_TOP_ADD_DISPLAY_TRACE(hdcp, display->index);
> +       }
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->dtm_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp1_create_session(struct mod_hdcp *hdcp)
> @@ -128,6 +136,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_create_session(struct mod_hdcp *hdcp)
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct mod_hdcp_display *display = get_first_added_display(hdcp);
>         struct ta_hdcp_shared_memory *hdcp_cmd;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
>         if (!psp->hdcp_context.hdcp_initialized) {
>                 DRM_ERROR("Failed to create hdcp session. HDCP TA is not initialized.");
> @@ -135,6 +144,8 @@ enum mod_hdcp_status mod_hdcp_hdcp1_create_session(struct mod_hdcp *hdcp)
>         }
>
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
> +
> +       mutex_lock(&psp->hdcp_context.mutex);
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
>         hdcp_cmd->in_msg.hdcp1_create_session.display_handle = display->index;
> @@ -144,16 +155,18 @@ enum mod_hdcp_status mod_hdcp_hdcp1_create_session(struct mod_hdcp *hdcp)
>
>         hdcp->auth.id = hdcp_cmd->out_msg.hdcp1_create_session.session_handle;
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP1_CREATE_SESSION_FAILURE;
> -
> -       hdcp->auth.msg.hdcp1.ainfo = hdcp_cmd->out_msg.hdcp1_create_session.ainfo_primary;
> -       memcpy(hdcp->auth.msg.hdcp1.aksv, hdcp_cmd->out_msg.hdcp1_create_session.aksv_primary,
> -               sizeof(hdcp->auth.msg.hdcp1.aksv));
> -       memcpy(hdcp->auth.msg.hdcp1.an, hdcp_cmd->out_msg.hdcp1_create_session.an_primary,
> -               sizeof(hdcp->auth.msg.hdcp1.an));
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP1_CREATE_SESSION_FAILURE;
> +       } else {
> +               hdcp->auth.msg.hdcp1.ainfo = hdcp_cmd->out_msg.hdcp1_create_session.ainfo_primary;
> +               memcpy(hdcp->auth.msg.hdcp1.aksv, hdcp_cmd->out_msg.hdcp1_create_session.aksv_primary,
> +                      sizeof(hdcp->auth.msg.hdcp1.aksv));
> +               memcpy(hdcp->auth.msg.hdcp1.an, hdcp_cmd->out_msg.hdcp1_create_session.an_primary,
> +                      sizeof(hdcp->auth.msg.hdcp1.an));
> +       }
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp1_destroy_session(struct mod_hdcp *hdcp)
> @@ -162,7 +175,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_destroy_session(struct mod_hdcp *hdcp)
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         uint8_t i = 0;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -171,27 +186,30 @@ enum mod_hdcp_status mod_hdcp_hdcp1_destroy_session(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP1_DESTROY_SESSION_FAILURE;
> -
> -       HDCP_TOP_HDCP1_DESTROY_SESSION_TRACE(hdcp);
> -       for (i = 0; i < MAX_NUM_OF_DISPLAYS; i++)
> -               if (is_display_encryption_enabled(
> -                               &hdcp->displays[i])) {
> -                       hdcp->displays[i].state =
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP1_DESTROY_SESSION_FAILURE;
> +       } else {
> +               HDCP_TOP_HDCP1_DESTROY_SESSION_TRACE(hdcp);
> +               for (i = 0; i < MAX_NUM_OF_DISPLAYS; i++)
> +                       if (is_display_encryption_enabled(&hdcp->displays[i])) {
> +                               hdcp->displays[i].state =
>                                         MOD_HDCP_DISPLAY_ACTIVE_AND_ADDED;
> -                       HDCP_HDCP1_DISABLED_TRACE(hdcp,
> -                                       hdcp->displays[i].index);
> -               }
> +                               HDCP_HDCP1_DISABLED_TRACE(
> +                                       hdcp, hdcp->displays[i].index);
> +                       }
> +       }
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp1_validate_rx(struct mod_hdcp *hdcp)
>  {
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -206,10 +224,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_validate_rx(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP1_VALIDATE_RX_FAILURE;
> -
> -       if (hdcp_cmd->out_msg.hdcp1_first_part_authentication.authentication_status ==
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP1_VALIDATE_RX_FAILURE;
> +       } else if (hdcp_cmd->out_msg.hdcp1_first_part_authentication.authentication_status ==
>             TA_HDCP_AUTHENTICATION_STATUS__HDCP1_FIRST_PART_COMPLETE) {
>                 /* needs second part of authentication */
>                 hdcp->connection.is_repeater = 1;
> @@ -219,12 +236,12 @@ enum mod_hdcp_status mod_hdcp_hdcp1_validate_rx(struct mod_hdcp *hdcp)
>         } else if (hdcp_cmd->out_msg.hdcp1_first_part_authentication.authentication_status ==
>                    TA_HDCP_AUTHENTICATION_STATUS__HDCP1_KSV_REVOKED) {
>                 hdcp->connection.is_hdcp1_revoked = 1;
> -               return MOD_HDCP_STATUS_HDCP1_BKSV_REVOKED;
> +               status = MOD_HDCP_STATUS_HDCP1_BKSV_REVOKED;
>         } else
> -               return MOD_HDCP_STATUS_HDCP1_VALIDATE_RX_FAILURE;
> -
> +               status = MOD_HDCP_STATUS_HDCP1_VALIDATE_RX_FAILURE;
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp1_enable_encryption(struct mod_hdcp *hdcp)
> @@ -232,7 +249,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_enable_encryption(struct mod_hdcp *hdcp)
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct mod_hdcp_display *display = get_first_added_display(hdcp);
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -241,14 +260,15 @@ enum mod_hdcp_status mod_hdcp_hdcp1_enable_encryption(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP1_ENABLE_ENCRYPTION;
> -
> -       if (!is_dp_mst_hdcp(hdcp)) {
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP1_ENABLE_ENCRYPTION;
> +       } else if (!is_dp_mst_hdcp(hdcp)) {
>                 display->state = MOD_HDCP_DISPLAY_ENCRYPTION_ENABLED;
>                 HDCP_HDCP1_ENABLED_TRACE(hdcp, display->index);
>         }
> -       return MOD_HDCP_STATUS_SUCCESS;
> +
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp1_validate_ksvlist_vp(struct mod_hdcp *hdcp)
> @@ -257,6 +277,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_validate_ksvlist_vp(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -287,6 +308,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_validate_ksvlist_vp(struct mod_hdcp *hdcp)
>                 status = MOD_HDCP_STATUS_HDCP1_VALIDATE_KSV_LIST_FAILURE;
>         }
>
> +       mutex_unlock(&psp->hdcp_context.mutex);
>         return status;
>  }
>
> @@ -296,7 +318,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_enable_dp_stream_encryption(struct mod_hdcp
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         int i = 0;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>
>         for (i = 0; i < MAX_NUM_OF_DISPLAYS; i++) {
> @@ -313,21 +337,26 @@ enum mod_hdcp_status mod_hdcp_hdcp1_enable_dp_stream_encryption(struct mod_hdcp
>
>                 psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -               if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -                       return MOD_HDCP_STATUS_HDCP1_ENABLE_STREAM_ENCRYPTION_FAILURE;
> +               if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +                       status = MOD_HDCP_STATUS_HDCP1_ENABLE_STREAM_ENCRYPTION_FAILURE;
> +                       break;
> +               }
>
>                 hdcp->displays[i].state = MOD_HDCP_DISPLAY_ENCRYPTION_ENABLED;
>                 HDCP_HDCP1_ENABLED_TRACE(hdcp, hdcp->displays[i].index);
>         }
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp1_link_maintenance(struct mod_hdcp *hdcp)
>  {
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
> @@ -339,12 +368,12 @@ enum mod_hdcp_status mod_hdcp_hdcp1_link_maintenance(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP1_LINK_MAINTENANCE_FAILURE;
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS ||
> +                       hdcp_cmd->out_msg.hdcp1_get_encryption_status.protection_level != 1)
> +               status = MOD_HDCP_STATUS_HDCP1_LINK_MAINTENANCE_FAILURE;
>
> -       return (hdcp_cmd->out_msg.hdcp1_get_encryption_status.protection_level == 1)
> -                      ? MOD_HDCP_STATUS_SUCCESS
> -                      : MOD_HDCP_STATUS_HDCP1_LINK_MAINTENANCE_FAILURE;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp1_get_link_encryption_status(struct mod_hdcp *hdcp,
> @@ -365,18 +394,22 @@ enum mod_hdcp_status mod_hdcp_hdcp2_create_session(struct mod_hdcp *hdcp)
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct mod_hdcp_display *display = get_first_added_display(hdcp);
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
> +
>
>         if (!psp->hdcp_context.hdcp_initialized) {
>                 DRM_ERROR("Failed to create hdcp session, HDCP TA is not initialized");
>                 return MOD_HDCP_STATUS_FAILURE;
>         }
>
> -       hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
> -       memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
> -
>         if (!display)
>                 return MOD_HDCP_STATUS_DISPLAY_NOT_FOUND;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
> +
> +       hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
> +       memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
> +
>         hdcp_cmd->in_msg.hdcp2_create_session_v2.display_handle = display->index;
>
>         if (hdcp->connection.link.adjust.hdcp2.force_type == MOD_HDCP_FORCE_TYPE_0)
> @@ -393,12 +426,14 @@ enum mod_hdcp_status mod_hdcp_hdcp2_create_session(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_CREATE_SESSION_FAILURE;
>
> -       hdcp->auth.id = hdcp_cmd->out_msg.hdcp2_create_session_v2.session_handle;
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> +               status = MOD_HDCP_STATUS_HDCP2_CREATE_SESSION_FAILURE;
> +       else
> +               hdcp->auth.id = hdcp_cmd->out_msg.hdcp2_create_session_v2.session_handle;
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_destroy_session(struct mod_hdcp *hdcp)
> @@ -406,7 +441,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_destroy_session(struct mod_hdcp *hdcp)
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         uint8_t i = 0;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -415,20 +452,21 @@ enum mod_hdcp_status mod_hdcp_hdcp2_destroy_session(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_DESTROY_SESSION_FAILURE;
> -
> -       HDCP_TOP_HDCP2_DESTROY_SESSION_TRACE(hdcp);
> -       for (i = 0; i < MAX_NUM_OF_DISPLAYS; i++)
> -               if (is_display_encryption_enabled(
> -                               &hdcp->displays[i])) {
> -                       hdcp->displays[i].state =
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP2_DESTROY_SESSION_FAILURE;
> +       } else {
> +               HDCP_TOP_HDCP2_DESTROY_SESSION_TRACE(hdcp);
> +               for (i = 0; i < MAX_NUM_OF_DISPLAYS; i++)
> +                       if (is_display_encryption_enabled(&hdcp->displays[i])) {
> +                               hdcp->displays[i].state =
>                                         MOD_HDCP_DISPLAY_ACTIVE_AND_ADDED;
> -                       HDCP_HDCP2_DISABLED_TRACE(hdcp,
> -                                       hdcp->displays[i].index);
> -               }
> +                               HDCP_HDCP2_DISABLED_TRACE(
> +                                       hdcp, hdcp->displays[i].index);
> +                       }
> +       }
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_prepare_ake_init(struct mod_hdcp *hdcp)
> @@ -437,7 +475,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_ake_init(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -452,12 +492,13 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_ake_init(struct mod_hdcp *hdcp)
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
>         if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_PREP_AKE_INIT_FAILURE;
> -
> -       memcpy(&hdcp->auth.msg.hdcp2.ake_init[0], &msg_out->prepare.transmitter_message[0],
> -              sizeof(hdcp->auth.msg.hdcp2.ake_init));
> +               status = MOD_HDCP_STATUS_HDCP2_PREP_AKE_INIT_FAILURE;
> +       else
> +               memcpy(&hdcp->auth.msg.hdcp2.ake_init[0], &msg_out->prepare.transmitter_message[0],
> +                      sizeof(hdcp->auth.msg.hdcp2.ake_init));
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_validate_ake_cert(struct mod_hdcp *hdcp)
> @@ -466,7 +507,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_ake_cert(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -488,26 +531,32 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_ake_cert(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_VALIDATE_AKE_CERT_FAILURE;
> -
> -       memcpy(hdcp->auth.msg.hdcp2.ake_no_stored_km, &msg_out->prepare.transmitter_message[0],
> -              sizeof(hdcp->auth.msg.hdcp2.ake_no_stored_km));
> -
> -       memcpy(hdcp->auth.msg.hdcp2.ake_stored_km,
> -              &msg_out->prepare.transmitter_message[sizeof(hdcp->auth.msg.hdcp2.ake_no_stored_km)],
> -              sizeof(hdcp->auth.msg.hdcp2.ake_stored_km));
> -
> -       if (msg_out->process.msg1_status == TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS) {
> -               hdcp->connection.is_km_stored = msg_out->process.is_km_stored ? 1 : 0;
> -               hdcp->connection.is_repeater = msg_out->process.is_repeater ? 1 : 0;
> -               return MOD_HDCP_STATUS_SUCCESS;
> -       } else if (msg_out->process.msg1_status == TA_HDCP2_MSG_AUTHENTICATION_STATUS__RECEIVERID_REVOKED) {
> -               hdcp->connection.is_hdcp2_revoked = 1;
> -               return MOD_HDCP_STATUS_HDCP2_AKE_CERT_REVOKED;
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP2_VALIDATE_AKE_CERT_FAILURE;
> +       } else {
> +               memcpy(hdcp->auth.msg.hdcp2.ake_no_stored_km,
> +                      &msg_out->prepare.transmitter_message[0],
> +                      sizeof(hdcp->auth.msg.hdcp2.ake_no_stored_km));
> +
> +               memcpy(hdcp->auth.msg.hdcp2.ake_stored_km,
> +                      &msg_out->prepare.transmitter_message[sizeof(hdcp->auth.msg.hdcp2.ake_no_stored_km)],
> +                      sizeof(hdcp->auth.msg.hdcp2.ake_stored_km));
> +
> +               if (msg_out->process.msg1_status ==
> +                   TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS) {
> +                       hdcp->connection.is_km_stored =
> +                               msg_out->process.is_km_stored ? 1 : 0;
> +                       hdcp->connection.is_repeater =
> +                               msg_out->process.is_repeater ? 1 : 0;
> +                       status = MOD_HDCP_STATUS_SUCCESS;
> +               } else if (msg_out->process.msg1_status ==
> +                          TA_HDCP2_MSG_AUTHENTICATION_STATUS__RECEIVERID_REVOKED) {
> +                       hdcp->connection.is_hdcp2_revoked = 1;
> +                       status = MOD_HDCP_STATUS_HDCP2_AKE_CERT_REVOKED;
> +               }
>         }
> -
> -       return MOD_HDCP_STATUS_HDCP2_VALIDATE_AKE_CERT_FAILURE;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_validate_h_prime(struct mod_hdcp *hdcp)
> @@ -516,7 +565,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_h_prime(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -543,16 +594,15 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_h_prime(struct mod_hdcp *hdcp)
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
>         if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_VALIDATE_H_PRIME_FAILURE;
> -
> -       if (msg_out->process.msg1_status != TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_VALIDATE_H_PRIME_FAILURE;
> +               status = MOD_HDCP_STATUS_HDCP2_VALIDATE_H_PRIME_FAILURE;
> +       else if (msg_out->process.msg1_status != TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> +               status = MOD_HDCP_STATUS_HDCP2_VALIDATE_H_PRIME_FAILURE;
>         else if (!hdcp->connection.is_km_stored &&
> -                msg_out->process.msg2_status != TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_VALIDATE_PAIRING_INFO_FAILURE;
> -
> +                  msg_out->process.msg2_status != TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> +               status = MOD_HDCP_STATUS_HDCP2_VALIDATE_PAIRING_INFO_FAILURE;
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_prepare_lc_init(struct mod_hdcp *hdcp)
> @@ -561,7 +611,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_lc_init(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -577,12 +629,13 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_lc_init(struct mod_hdcp *hdcp)
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
>         if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_PREP_LC_INIT_FAILURE;
> -
> -       memcpy(hdcp->auth.msg.hdcp2.lc_init, &msg_out->prepare.transmitter_message[0],
> -              sizeof(hdcp->auth.msg.hdcp2.lc_init));
> +               status = MOD_HDCP_STATUS_HDCP2_PREP_LC_INIT_FAILURE;
> +       else
> +               memcpy(hdcp->auth.msg.hdcp2.lc_init, &msg_out->prepare.transmitter_message[0],
> +                      sizeof(hdcp->auth.msg.hdcp2.lc_init));
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_validate_l_prime(struct mod_hdcp *hdcp)
> @@ -591,7 +644,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_l_prime(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -610,13 +665,12 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_l_prime(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_VALIDATE_L_PRIME_FAILURE;
> -
> -       if (msg_out->process.msg1_status != TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_VALIDATE_L_PRIME_FAILURE;
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS ||
> +                       msg_out->process.msg1_status != TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> +               status = MOD_HDCP_STATUS_HDCP2_VALIDATE_L_PRIME_FAILURE;
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_prepare_eks(struct mod_hdcp *hdcp)
> @@ -625,7 +679,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_eks(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -642,20 +698,24 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_eks(struct mod_hdcp *hdcp)
>         hdcp_cmd->cmd_id = TA_HDCP_COMMAND__HDCP2_PREPARE_PROCESS_AUTHENTICATION_MSG_V2;
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_PREP_EKS_FAILURE;
> -
> -       memcpy(hdcp->auth.msg.hdcp2.ske_eks, &msg_out->prepare.transmitter_message[0],
> -              sizeof(hdcp->auth.msg.hdcp2.ske_eks));
> -       msg_out->prepare.msg1_desc.msg_size = sizeof(hdcp->auth.msg.hdcp2.ske_eks);
> -
> -       if (is_dp_hdcp(hdcp)) {
> -               memcpy(hdcp->auth.msg.hdcp2.content_stream_type_dp,
> -                      &msg_out->prepare.transmitter_message[sizeof(hdcp->auth.msg.hdcp2.ske_eks)],
> -                      sizeof(hdcp->auth.msg.hdcp2.content_stream_type_dp));
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP2_PREP_EKS_FAILURE;
> +       } else {
> +               memcpy(hdcp->auth.msg.hdcp2.ske_eks,
> +                      &msg_out->prepare.transmitter_message[0],
> +                      sizeof(hdcp->auth.msg.hdcp2.ske_eks));
> +               msg_out->prepare.msg1_desc.msg_size =
> +                       sizeof(hdcp->auth.msg.hdcp2.ske_eks);
> +
> +               if (is_dp_hdcp(hdcp)) {
> +                       memcpy(hdcp->auth.msg.hdcp2.content_stream_type_dp,
> +                              &msg_out->prepare.transmitter_message[sizeof(hdcp->auth.msg.hdcp2.ske_eks)],
> +                              sizeof(hdcp->auth.msg.hdcp2.content_stream_type_dp));
> +               }
>         }
> +       mutex_unlock(&psp->hdcp_context.mutex);
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_enable_encryption(struct mod_hdcp *hdcp)
> @@ -663,27 +723,30 @@ enum mod_hdcp_status mod_hdcp_hdcp2_enable_encryption(struct mod_hdcp *hdcp)
>         struct psp_context *psp = hdcp->config.psp.handle;
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct mod_hdcp_display *display = get_first_added_display(hdcp);
> -
> -       hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
> -       memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
>         if (!display)
>                 return MOD_HDCP_STATUS_DISPLAY_NOT_FOUND;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
> +
> +       hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
> +       memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
> +
>         hdcp_cmd->in_msg.hdcp2_set_encryption.session_handle = hdcp->auth.id;
>
>         hdcp_cmd->cmd_id = TA_HDCP_COMMAND__HDCP2_SET_ENCRYPTION;
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_ENABLE_ENCRYPTION_FAILURE;
> -
> -       if (!is_dp_mst_hdcp(hdcp)) {
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP2_ENABLE_ENCRYPTION_FAILURE;
> +       } else if (!is_dp_mst_hdcp(hdcp)) {
>                 display->state = MOD_HDCP_DISPLAY_ENCRYPTION_ENABLED;
>                 HDCP_HDCP2_ENABLED_TRACE(hdcp, display->index);
>         }
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_validate_rx_id_list(struct mod_hdcp *hdcp)
> @@ -692,6 +755,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_rx_id_list(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
> +
> +       mutex_lock(&psp->hdcp_context.mutex);
>
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
> @@ -712,23 +778,26 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_rx_id_list(struct mod_hdcp *hdcp)
>
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_VALIDATE_RX_ID_LIST_FAILURE;
> -
> -       memcpy(hdcp->auth.msg.hdcp2.repeater_auth_ack, &msg_out->prepare.transmitter_message[0],
> -              sizeof(hdcp->auth.msg.hdcp2.repeater_auth_ack));
> -
> -       if (msg_out->process.msg1_status == TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS) {
> -               hdcp->connection.is_km_stored = msg_out->process.is_km_stored ? 1 : 0;
> -               hdcp->connection.is_repeater = msg_out->process.is_repeater ? 1 : 0;
> -               return MOD_HDCP_STATUS_SUCCESS;
> -       } else if (msg_out->process.msg1_status == TA_HDCP2_MSG_AUTHENTICATION_STATUS__RECEIVERID_REVOKED) {
> -               hdcp->connection.is_hdcp2_revoked = 1;
> -               return MOD_HDCP_STATUS_HDCP2_RX_ID_LIST_REVOKED;
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP2_VALIDATE_RX_ID_LIST_FAILURE;
> +       } else {
> +               memcpy(hdcp->auth.msg.hdcp2.repeater_auth_ack,
> +                      &msg_out->prepare.transmitter_message[0],
> +                      sizeof(hdcp->auth.msg.hdcp2.repeater_auth_ack));
> +
> +               if (msg_out->process.msg1_status ==
> +                   TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS) {
> +                       hdcp->connection.is_km_stored = msg_out->process.is_km_stored ? 1 : 0;
> +                       hdcp->connection.is_repeater = msg_out->process.is_repeater ? 1 : 0;
> +                       status = MOD_HDCP_STATUS_SUCCESS;
> +               } else if (msg_out->process.msg1_status ==
> +                          TA_HDCP2_MSG_AUTHENTICATION_STATUS__RECEIVERID_REVOKED) {
> +                       hdcp->connection.is_hdcp2_revoked = 1;
> +                       status = MOD_HDCP_STATUS_HDCP2_RX_ID_LIST_REVOKED;
> +               }
>         }
> -
> -
> -       return MOD_HDCP_STATUS_HDCP2_VALIDATE_RX_ID_LIST_FAILURE;
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_enable_dp_stream_encryption(struct mod_hdcp *hdcp)
> @@ -737,7 +806,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_enable_dp_stream_encryption(struct mod_hdcp
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         uint8_t i;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -763,8 +834,13 @@ enum mod_hdcp_status mod_hdcp_hdcp2_enable_dp_stream_encryption(struct mod_hdcp
>                 HDCP_HDCP2_ENABLED_TRACE(hdcp, hdcp->displays[i].index);
>         }
>
> -       return (hdcp_cmd->hdcp_status == TA_HDCP_STATUS__SUCCESS) ? MOD_HDCP_STATUS_SUCCESS
> -                                                                 : MOD_HDCP_STATUS_HDCP2_ENABLE_STREAM_ENCRYPTION;
> +       if (hdcp_cmd->hdcp_status == TA_HDCP_STATUS__SUCCESS)
> +               status = MOD_HDCP_STATUS_SUCCESS;
> +       else
> +               status = MOD_HDCP_STATUS_HDCP2_ENABLE_STREAM_ENCRYPTION;
> +
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_prepare_stream_management(struct mod_hdcp *hdcp)
> @@ -774,7 +850,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_stream_management(struct mod_hdcp *h
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -789,15 +867,17 @@ enum mod_hdcp_status mod_hdcp_hdcp2_prepare_stream_management(struct mod_hdcp *h
>         hdcp_cmd->cmd_id = TA_HDCP_COMMAND__HDCP2_PREPARE_PROCESS_AUTHENTICATION_MSG_V2;
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS)
> -               return MOD_HDCP_STATUS_HDCP2_PREPARE_STREAM_MANAGEMENT_FAILURE;
> -
> -       hdcp->auth.msg.hdcp2.stream_manage_size = msg_out->prepare.msg1_desc.msg_size;
> -
> -       memcpy(hdcp->auth.msg.hdcp2.repeater_auth_stream_manage, &msg_out->prepare.transmitter_message[0],
> -              sizeof(hdcp->auth.msg.hdcp2.repeater_auth_stream_manage));
> +       if (hdcp_cmd->hdcp_status != TA_HDCP_STATUS__SUCCESS) {
> +               status = MOD_HDCP_STATUS_HDCP2_PREPARE_STREAM_MANAGEMENT_FAILURE;
> +       } else {
> +               hdcp->auth.msg.hdcp2.stream_manage_size = msg_out->prepare.msg1_desc.msg_size;
>
> -       return MOD_HDCP_STATUS_SUCCESS;
> +               memcpy(hdcp->auth.msg.hdcp2.repeater_auth_stream_manage,
> +                      &msg_out->prepare.transmitter_message[0],
> +                      sizeof(hdcp->auth.msg.hdcp2.repeater_auth_stream_manage));
> +       }
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_validate_stream_ready(struct mod_hdcp *hdcp)
> @@ -806,7 +886,9 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_stream_ready(struct mod_hdcp *hdcp)
>         struct ta_hdcp_shared_memory *hdcp_cmd;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2 *msg_in;
>         struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2 *msg_out;
> +       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>
> +       mutex_lock(&psp->hdcp_context.mutex);
>         hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.hdcp_shared_buf;
>         memset(hdcp_cmd, 0, sizeof(struct ta_hdcp_shared_memory));
>
> @@ -825,10 +907,14 @@ enum mod_hdcp_status mod_hdcp_hdcp2_validate_stream_ready(struct mod_hdcp *hdcp)
>         hdcp_cmd->cmd_id = TA_HDCP_COMMAND__HDCP2_PREPARE_PROCESS_AUTHENTICATION_MSG_V2;
>         psp_hdcp_invoke(psp, hdcp_cmd->cmd_id);
>
> -       return (hdcp_cmd->hdcp_status == TA_HDCP_STATUS__SUCCESS) &&
> -                              (msg_out->process.msg1_status == TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> -                      ? MOD_HDCP_STATUS_SUCCESS
> -                      : MOD_HDCP_STATUS_HDCP2_VALIDATE_STREAM_READY_FAILURE;
> +       if (hdcp_cmd->hdcp_status == TA_HDCP_STATUS__SUCCESS &&
> +           msg_out->process.msg1_status == TA_HDCP2_MSG_AUTHENTICATION_STATUS__SUCCESS)
> +               status = MOD_HDCP_STATUS_SUCCESS;
> +       else
> +               status = MOD_HDCP_STATUS_HDCP2_VALIDATE_STREAM_READY_FAILURE;
> +
> +       mutex_unlock(&psp->hdcp_context.mutex);
> +       return status;
>  }
>
>  enum mod_hdcp_status mod_hdcp_hdcp2_get_link_encryption_status(struct mod_hdcp *hdcp,
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
