Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41007780CCE
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Aug 2023 15:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D464C10E524;
	Fri, 18 Aug 2023 13:46:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874310E4C1
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Aug 2023 10:30:59 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso1020942e87.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Aug 2023 03:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692354657; x=1692959457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4LtmyRH3uquQa35qZEBrjYfCQfjxVyQMuxjwadVuCUE=;
 b=qq8HjUXVe1+6MOle1ON6Z8zxId8JviF3JUrcPfSleTCrvzSKdvjDMkBU6TIlonV19S
 BwQVl9Umc9Q6ci6cV+sLDKyj8qe5p2YcFyHxCxgnld7ac9NdQHCDvU5TQ/oPdpggzL0U
 NdDFes6sCMmTowWrGl+LzeZuuCq+sNOF/uO3XEuyXbBbZJuzaJK7Do4KF5tuSrK69fnK
 C/Vgm95LlW89hmRWdKEkmQm/IHDaUbZHJiFU0Ia4SoFq4SuFheTGOnN9CJpkqeIg4cLR
 /ddfNHU57zNFhzMtIRAo1ZzYC33PxrDJfilk472vCGfM84hrUqX8GopXk9lsxvAtFukw
 11Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692354657; x=1692959457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4LtmyRH3uquQa35qZEBrjYfCQfjxVyQMuxjwadVuCUE=;
 b=FP2GA7CA14VgQvHHRXrYMFGLeXXlFB9Ixisybxr+eaiefIL+gEGHcZPrNW2rrb1YwI
 c1gEosVjkrsICTW1DlNSCpYMuSeAY7l2jm9MrWEmAdyv7KJOnZTxp6798I5NASQxoJav
 c2iNBAmBx6GfLiHcoGiefucprQSqaHEjDHv8LIka6Y50QMfYWdGXjbn0myQJGhOzMxcP
 76diziQvLUM/vOedOAipzbWI4gCD+pFJQCbOpvPNj6DJvq0mZJndpW+P6zitYzDhie08
 1WeTrPUfzFBT/3dRq98ZYW0Rfq/V9zYp1jAe8Lu5a9I1NdPLxklQMQv1Of95R65cT4a+
 KxVQ==
X-Gm-Message-State: AOJu0YwQL0uW9myvd7A0DHLQKhp/YVU1mfRGfY9gTE1UPVuRdAkgLAOI
 LA4/NEC6B0zwJkvrnBPKB2UPaQ==
X-Google-Smtp-Source: AGHT+IHzaCo2eTE/te1HsoVUFdeT0UZnxqjK11M2NmGV8gd/927nvst3bj0UfF8wjINrubj+z1+1WQ==
X-Received: by 2002:a19:ca1d:0:b0:4f8:586a:8af6 with SMTP id
 a29-20020a19ca1d000000b004f8586a8af6mr1224933lfg.4.1692354657346; 
 Fri, 18 Aug 2023 03:30:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 16-20020ac24830000000b004ff1b5c8df3sm275637lft.211.2023.08.18.03.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 03:30:56 -0700 (PDT)
Message-ID: <6097eb1d-6b00-4a0f-a91f-5b19f2b422eb@linaro.org>
Date: Fri, 18 Aug 2023 13:30:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
Content-Language: en-GB
To: Simon Ser <contact@emersion.fr>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
 <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
 <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
 <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
 <20230803204459.GD27752@pendragon.ideasonboard.com>
 <TR8IBdXbd0C4U8Z4zf9ZLEH66QMutWs0QAAkPnMlKiOvgEZCk6AfEIPcIfRC555XWs8eSzeCCCW9R-3NwxZg6hDhPvPseAgAULAdUQ6epDA=@emersion.fr>
 <d9f9c272-ce9b-4599-bb11-1c026087ead3@linaro.org>
 <gIjbz8oq8AuY8E5_XGKnJNjIyQK9SDxp2-3Ep-Dr3D9T_-iUIt-q-oFgarZor4jtdI3682ZtuvQnaQBhTrc5OR6G2sqvDxbmxGZmcRrBAio=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <gIjbz8oq8AuY8E5_XGKnJNjIyQK9SDxp2-3Ep-Dr3D9T_-iUIt-q-oFgarZor4jtdI3682ZtuvQnaQBhTrc5OR6G2sqvDxbmxGZmcRrBAio=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 18 Aug 2023 13:46:00 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 18/08/2023 09:24, Simon Ser wrote:
> On Thursday, August 17th, 2023 at 21:33, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
>> We have been looking for a way to document that the corresponding DP
>> port is represented by the USB connector on the device.
>>
>> Consequently, I believe the best way to document it, would be to use
>> DisplayPort / USB, when there is no dongle connected, switching to
>> DisplayPort / HDMI, DisplayPort / VGA, DisplayPort / DisplayPort, etc.
>> when the actual dongle / display is connected and then switching back to
>> the DisplayPort / USB when it gets disconnected.
>>
>> If this sounds good to all parties, I'll post v2, adding this
>> explanation to the cover letter.
> 
> But how can user-space discover that the port is USB-C when it's
> connected? That information is lost at this point.

Yes, unfortunately.

> (In addition, this clashes with the existing semantics of the
> subconnector prop as discussed before: USB-C is not sub-, it's super-.)

Ok. How do we proceed then? Is it fine to add another property for DP 
case? Do you have any particular property name in mind? I will follow 
with addition of this property then.

-- 
With best wishes
Dmitry

