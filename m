Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B153936D
	for <lists+amd-gfx@lfdr.de>; Tue, 31 May 2022 16:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08D10ED8C;
	Tue, 31 May 2022 14:55:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434B6112868
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 May 2022 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653994606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AMEdZHq6r8jK1K5fClop/kDp2DOnuh5RSKQmQhnlmo=;
 b=C2eES+l/dXwru1vP0ZJTC8D2kkFc1fpGn4czJDV4moEQxNt5S/il66fhtQ1PjPoPSBxsXd
 fsBuW35Hhr9GdLwzY5aq+txXqEw8HrtGXe5PuIUK6UHagdEqsRPWCkE0GFqpwWwnNyIC2T
 o2Z+joTNtERN3YuoArSEH4QKsFQoMrA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-xMC7hYl8NVSFiMuIgskqAA-1; Tue, 31 May 2022 06:56:45 -0400
X-MC-Unique: xMC7hYl8NVSFiMuIgskqAA-1
Received: by mail-lf1-f69.google.com with SMTP id
 y22-20020ac24216000000b00478eb3ffbc9so1543005lfh.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 May 2022 03:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5AMEdZHq6r8jK1K5fClop/kDp2DOnuh5RSKQmQhnlmo=;
 b=wslPrbzLv0j2lBF6cBGuIiDJ8q9Au/0842juBm378xpimuOQ4eFbbKZGKS9/RtdoZ1
 wpLklptC0WQKPHDfcg2TyjAk9b9NeI1n1fSH0qOnmBe5KHis4+3129c+N2BRy9ZU8oJ9
 MilRMQ4K+XWg46xUVb5XbucAKNN/ZnZtcvyB9rkTC4BBj2eKvQyawyPciZUnEWr9CTGa
 uCqfud/4dk2X54ht7uOowovHYyaZKO68KPzxakVRclEKKG5Okw1NObpayH6tawxJl68Z
 CsqKMBy9gVzqiH6BOoFZ5//z0GRft1XsHnvdc9fkvsLypP+IGgDeCGmrEGFzg/w1GMSS
 9YSg==
X-Gm-Message-State: AOAM532A/0BLgh2B/NAeyO53KhZQEjfsOu1lgMurDJLuF3Ll4QnLqY5c
 Ogi5MBTxz4U/gSZqmSy7pyEfDClIi+FxM04f2rdzWDFTTpwruCWWzbC7YiCE8CuU3mK0QVOwQ3D
 w0T8nOgC4HeKwvt3S/rU4lKthDg==
X-Received: by 2002:a2e:8958:0:b0:255:48a6:b34f with SMTP id
 b24-20020a2e8958000000b0025548a6b34fmr9086911ljk.32.1653994603706; 
 Tue, 31 May 2022 03:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT/kJtZFCGg6vVnaOEu+TAnTzoEpR9/PyP/37VarQ8+j7ln571wRc5ni+laLwliCYrgww7xA==
X-Received: by 2002:a2e:8958:0:b0:255:48a6:b34f with SMTP id
 b24-20020a2e8958000000b0025548a6b34fmr9086904ljk.32.1653994603496; 
 Tue, 31 May 2022 03:56:43 -0700 (PDT)
Received: from [10.101.1.23] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 s22-20020a2e9c16000000b0025567cf8633sm16866lji.85.2022.05.31.03.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 03:56:42 -0700 (PDT)
Message-ID: <5ba0b86a-fa9c-ed97-3b43-7814599deab5@redhat.com>
Date: Tue, 31 May 2022 12:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 0/4] Separate panel orientation property creating and
 value setting
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220530081910.3947168-1-hsinyi@chromium.org>
 <a8d1fe13-e747-016a-2d45-bfb50f23f2d9@redhat.com>
 <CAJMQK-iM-ip7edA2mBOhp-8maWKG5+kTceZUM5U6BOLLBq1H4Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJMQK-iM-ip7edA2mBOhp-8maWKG5+kTceZUM5U6BOLLBq1H4Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 31 May 2022 14:55:52 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Simon Ser <contact@emersion.fr>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 5/30/22 13:34, Hsin-Yi Wang wrote:
> On Mon, May 30, 2022 at 4:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 5/30/22 10:19, Hsin-Yi Wang wrote:
>>> Some drivers, eg. mtk_drm and msm_drm, rely on the panel to set the
>>> orientation. Panel calls drm_connector_set_panel_orientation() to create
>>> orientation property and sets the value. However, connector properties
>>> can't be created after drm_dev_register() is called. The goal is to
>>> separate the orientation property creation, so drm drivers can create it
>>> earlier before drm_dev_register().
>>
>> Sorry for jumping in pretty late in the discussion (based on the v10
>> I seem to have missed this before).
>>
>> This sounds to me like the real issue here is that drm_dev_register()
>> is getting called too early?
>>
> Right.
> 
>> To me it seems sensible to delay calling drm_dev_register() and
>> thus allowing userspace to start detecting available displays +
>> features until after the panel has been probed.
>>
> 
> Most panels set this value very late, in .get_modes callback (since it
> is when the connector is known), though the value was known during
> panel probe.

Hmm I would expect the main drm/kms driver to register the drm_connector
object after probing the panel, right ?

So maybe this is a problem with the panel API? How about adding 
separate callback to the panel API to get the orientation, which the
main drm/kms driver can then call before registering the connector ?

And then have the main drm/kms driver call
drm_connector_set_panel_orientation() with the returned orientation
on the connecter before registering it.

The new get_orientation callback for the panel should of course
be optional (IOW amy be NULL), so we probably want a small
helper for drivers using panel (sub)drivers to take care of
the process of getting the panel orientation from the panel
(if supported) and then setting it on the connector.


> I think we can also let drm check if they have remote panel nodes: If
> there is a panel and the panel sets the orientation, let the drm read
> this value and set the property. Does this workflow sound reasonable?
> 
> The corresponding patch to implement this:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/

That is a suprisingly small patch (which is good). I guess that
my suggestion to add a new panel driver callback to get
the orientation would be a bit bigget then this. Still I think
that that would be a bit cleaner, as it would also solve this
for cases where the orientation comes from the panel itself
(through say some EDID extenstion) rather then from devicetree.

Still I think either way should be acceptable upstream.

Opinions from other drm devs on the above are very much welcome!

Your small patch nicely avoids the probe ordering problem,
so it is much better then this patch series.

Regards,

Hans



> 
> Thanks
> 
>> I see a devicetree patch in this series, so I guess that the panel
>> is described in devicetree. Especially in the case of devicetree
>> I would expect the kernel to have enough info to do the right
>> thing and make sure the panel is probed before calling
>> drm_dev_register() ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>
>>> After this series, drm_connector_set_panel_orientation() works like
>>> before. It won't affect existing callers of
>>> drm_connector_set_panel_orientation(). The only difference is that
>>> some drm drivers can call drm_connector_init_panel_orientation_property()
>>> earlier.
>>>
>>> Hsin-Yi Wang (4):
>>>   gpu: drm: separate panel orientation property creating and value
>>>     setting
>>>   drm/mediatek: init panel orientation property
>>>   drm/msm: init panel orientation property
>>>   arm64: dts: mt8183: Add panel rotation
>>>
>>>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
>>>  drivers/gpu/drm/drm_connector.c               | 58 ++++++++++++++-----
>>>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  7 +++
>>>  drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++
>>>  include/drm/drm_connector.h                   |  2 +
>>>  5 files changed, 59 insertions(+), 13 deletions(-)
>>>
>>
> 

