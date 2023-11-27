Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820C7FA186
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Nov 2023 14:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9719010E2A4;
	Mon, 27 Nov 2023 13:54:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B719110E24E
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Nov 2023 11:47:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 09DAC40E0031; 
 Mon, 27 Nov 2023 11:47:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id x6hZ-EGEfnLs; Mon, 27 Nov 2023 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1701085618; bh=/FKxTv6AjjlU5bbOmJK6+9TUZ7Du5ZJJm4TeskqqvDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T39uneXWDF1Ayh/26hwFQzyFylzQq/fGYQ/pZjE00drc8L7ewUtywddk4NmZ9+G2A
 cNMQFZiDoQpkBXYr+9ueP3XqABPv9su1UtpUOHHvL8x42KVfJrmeP+TV5+Ybg9ohjU
 EWdgBy/agDBhfapaexE1uPpNZTYGB+0NLO1Sjfjtu/8Hm7KZBECRSIJMzmzjbPbtka
 6MhmlWMZ3jhL9Cpx6miF+9TGH6huE27f7v9GJL0AtWafiObEQn7ANa9giWiNhAH19I
 z0vKen3cnNx5A4BzGf+TM480djipEgzF0SABapRFCVrx7Z2HqpljI/KCSp7bRkEhxo
 6znRyGB2W/nurt4gEYaP+sENYbqiNfZ8UZ5VpOLWEM3AOWHI67gU8GeuNkVwsWvQS5
 YVmZaZXJZoM+CzLYWynQMPLiz/Homj7kOD28BDcrc7Ww1rqtbVttoZZ6CiHV48oeU8
 zcihij6RTcC/GRJzyHeHhRAp6M5f76iCH9s9S2thrxsb9hJqOW6JwgNuqH3BfzVMEU
 tsco5ZYMeMd0OdtVMpJFAR43wM0bYGrexqmpmrXh/yi7rvamuM9TZeOUdBwHED9eBU
 vePzmB65Bc/N0JiwW/xkVyEB4IUNyFZ2lOzIupQTJdNqwlQqru8mms+6DoYLYFSorF
 qmsF3LvP7Jsn0wAYCCIPe72k=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1D8A540E014B;
 Mon, 27 Nov 2023 11:46:49 +0000 (UTC)
Date: Mon, 27 Nov 2023 12:46:48 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: [PATCH 06/20] x86/mce/amd: Use helper for GPU UMC bank type checks
Message-ID: <20231127114648.GNZWSBqPq3AzQkwk+S@fat_crate.local>
References: <20231118193248.1296798-1-yazen.ghannam@amd.com>
 <20231118193248.1296798-7-yazen.ghannam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231118193248.1296798-7-yazen.ghannam@amd.com>
X-Mailman-Approved-At: Mon, 27 Nov 2023 13:54:32 +0000
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
Cc: tony.luck@intel.com, x86@kernel.org, Avadhut.Naik@amd.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Smita.KoralahalliChannabasappa@amd.com, linux-trace-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, Nov 18, 2023 at 01:32:34PM -0600, Yazen Ghannam wrote:
> +/* GPU UMCs have MCATYPE=0x1.*/
> +bool smca_gpu_umc_bank_type(u64 ipid)
> +{
> +	if (!smca_umc_bank_type(ipid))
> +		return false;
> +
> +	return FIELD_GET(MCI_IPID_MCATYPE, ipid) == 0x1;
> +}

And now this tells you that you want to use

	u32 hwid_mcatype;       /* (hwid,mcatype) tuple */

everywhere and do your macros around that thing.

No need for yet another helper as this all is static information which
doesn't change.

> +EXPORT_SYMBOL_GPL(smca_gpu_umc_bank_type);

Definitely not another export.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
