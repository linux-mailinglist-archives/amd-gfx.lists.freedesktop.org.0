Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4587E09A3
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Nov 2023 20:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2DA10E198;
	Fri,  3 Nov 2023 19:50:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F8810EA4C
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Nov 2023 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699040307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=18fxGFPyEfYX6zujRVQDCVGp1gVPnAg8xcOJqGUDNpU=;
 b=WEkItedecRds0qOcBxKgV+BlXanqPNvIhVM5BPB+KWD42h5LD+wCXlA7+0afMHD2HRzct6
 aw1oH+KuwFhmX5ToyHwMeCo/q/KLiUER6Ujmq6O+OslgxjzVLMGrjuMrAeY9wibNMVIyYB
 tK+yddk4hNYtAkEd+AB9NeOH7Z9pGw8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-_aaUtWqgOf6iKw7oyCcrIw-1; Fri, 03 Nov 2023 15:38:26 -0400
X-MC-Unique: _aaUtWqgOf6iKw7oyCcrIw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-543f1c6dcaeso1831467a12.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 03 Nov 2023 12:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699040305; x=1699645105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18fxGFPyEfYX6zujRVQDCVGp1gVPnAg8xcOJqGUDNpU=;
 b=ssuwA3gjAQeWSOFT0fiH6yNGXNtoOlrmH44SKpTYEyqvTUBwXWjrDBV0MMoohsvarK
 pqX/xauUr92DBiWH5f5KIgR/OKhlmbf1DwQL6cGCRW0WRI1uq40wHz7KBxTWU19IsTxb
 Snh3iN/izgOawIorTmSzZSyHl8e0u3G4J0JJ0uh7V+M3mgXzOFcC1nb+7ezl7lsN0BWR
 Pr0Vn71XEuKVdb1lix1Wq50G35Y2yWauLfpfPoIbluJxPGhaDnlvodiWBU/xBqnNa+tl
 PLgIu6aSxagcYnHU8kZZ4d1kAuRP4t76o4W+S9h+CTo2NsYwi0/By71UR/Zn7R2+YPXQ
 TYyA==
X-Gm-Message-State: AOJu0YwrmEBG3ViuhgrJroMp+74bzTqLYY3y0zjcMVRD6vemeWF3XWXc
 hiT7yibAvDZoGXwEYoi3r1GGg5JWVkRVewaavKH6rQgD3CUiqITTdIROpYc2J/Px+oA48sBYKaS
 B1LUP7oyEiQV8pjgGbmqi2jsfZA==
X-Received: by 2002:a17:907:3da1:b0:9b7:37de:6009 with SMTP id
 he33-20020a1709073da100b009b737de6009mr8119027ejc.3.1699040305101; 
 Fri, 03 Nov 2023 12:38:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2EgYFYkxhAFVhtUcYX07z+ZAHa6gRCnHShMvlzepM1PxNvaeqEAxxrCtaSa8ojD2/gCJsUw==
X-Received: by 2002:a17:907:3da1:b0:9b7:37de:6009 with SMTP id
 he33-20020a1709073da100b009b737de6009mr8119007ejc.3.1699040304766; 
 Fri, 03 Nov 2023 12:38:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 lk22-20020a170906cb1600b0099d804da2e9sm1220533ejb.225.2023.11.03.12.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 12:38:24 -0700 (PDT)
Message-ID: <d6466210-fdb7-e9e2-68bb-551b263f439d@redhat.com>
Date: Fri, 3 Nov 2023 20:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/9] PCI: Rename is_thunderbolt to is_tunneled
To: Mario Limonciello <mario.limonciello@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-7-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231103190758.82911-7-mario.limonciello@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 03 Nov 2023 19:50:33 +0000
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Mark Gross <markgross@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Andreas Noever <andreas.noever@gmail.com>,
 David Airlie <airlied@gmail.com>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 11/3/23 20:07, Mario Limonciello wrote:
> The `is_thunderbolt` bit has been used to indicate that a PCIe device
> contained the Intel VSEC which is used by various parts of the kernel
> to change behavior. To later allow usage with USB4 controllers as well,
> rename this to `is_tunneled`.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Here is my ack for the trivial drivers/platform/x86/apple-gmux.c change:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Bjorn, feel free to route this through the PCI tree.

Regards,

Hans




> ---
>  drivers/pci/pci.c                 | 2 +-
>  drivers/pci/probe.c               | 2 +-
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  include/linux/pci.h               | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 59c01d68c6d5..d9aa5a39f585 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3032,7 +3032,7 @@ bool pci_bridge_d3_possible(struct pci_dev *bridge)
>  			return true;
>  
>  		/* Even the oldest 2010 Thunderbolt controller supports D3. */
> -		if (bridge->is_thunderbolt)
> +		if (bridge->is_tunneled)
>  			return true;
>  
>  		/* Platform might know better if the bridge supports D3 */
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 795534589b98..518413d15402 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1597,7 +1597,7 @@ static void set_pcie_thunderbolt(struct pci_dev *dev)
>  	/* Is the device part of a Thunderbolt controller? */
>  	vsec = pci_find_vsec_capability(dev, PCI_VENDOR_ID_INTEL, PCI_VSEC_ID_INTEL_TBT);
>  	if (vsec)
> -		dev->is_thunderbolt = 1;
> +		dev->is_tunneled = 1;
>  }
>  
>  static void set_pcie_untrusted(struct pci_dev *dev)
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 1417e230edbd..20315aa4463a 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -774,7 +774,7 @@ static int gmux_resume(struct device *dev)
>  
>  static int is_thunderbolt(struct device *dev, void *data)
>  {
> -	return to_pci_dev(dev)->is_thunderbolt;
> +	return to_pci_dev(dev)->is_tunneled;
>  }
>  
>  static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 439c2dac8a3e..b1724f25fb02 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -440,7 +440,7 @@ struct pci_dev {
>  	unsigned int	is_virtfn:1;
>  	unsigned int	is_hotplug_bridge:1;
>  	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
> -	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
> +	unsigned int	is_tunneled:1;		/* Tunneled TBT or USB4 link */
>  	unsigned int	no_command_complete:1;	/* No command completion */
>  	/*
>  	 * Devices marked being untrusted are the ones that can potentially

