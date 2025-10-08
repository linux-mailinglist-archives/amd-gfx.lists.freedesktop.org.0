Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2EBC56F4
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Oct 2025 16:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4D710E11E;
	Wed,  8 Oct 2025 14:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S4vO8cmv";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E7A10E11E
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Oct 2025 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KZcvcuJmCJLgwzmk3xBrDBwQzMhOTTgD2G38RJMWeRU=; b=S4vO8cmvOX8oK1bjzQGX8ivGxG
 dH2OlcRnvhvFNhsmXG5l6EKT6OAbGSrUVVwu/yuvMTgXM3E4Dt5AiemcJwWumw4OXhCTamxQlrW/B
 O3t8id7Z3qE0RKis3b3GPR55NJ+2tOy5nzW26d07ePg+s7eU1ue5jIq0v8U5JRQctfHlSwwGD21wg
 nFz8/1Tr9Nc/gvbDX2fLBXtmyUFWTWkADbh43QNnxMkigdUxVD9icBLFwtYoSQcCHimdhTOKh5XXV
 McoMQyJcCPQE/u1Vcg8N/uhEIcr8Y/YZhPB9/FwzOaKjXFMtdWvKKI4JTlmVa9IJWE3r8Avq3EpiB
 BkMh+lUg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v6V9X-006g3t-MV; Wed, 08 Oct 2025 16:28:27 +0200
Message-ID: <b9edaad2-06bf-4b6e-95a3-9b5ba0e37b86@igalia.com>
Date: Wed, 8 Oct 2025 15:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] More compact IB emission
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250911114155.24786-1-tvrtko.ursulin@igalia.com>
 <CADnq5_OD2FoiNxj3FqrqQSLCs7h_a-4uRy5ucceEA+Px-5Ea7w@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <CADnq5_OD2FoiNxj3FqrqQSLCs7h_a-4uRy5ucceEA+Px-5Ea7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 08/10/2025 15:08, Alex Deucher wrote:
> Applied the series.  Thanks!

Thank you and fingers crossed I did not fat finger anything that your CI 
wouldn't find!

I wish something similar could be done for amdgpu_ring_write too, but 
that one is waiting on Christian to, AFAIR, become idle enough to 
untangle some ptr masking issues.

Regards,

Tvrtko

> On Thu, Sep 11, 2025 at 7:42 AM Tvrtko Ursulin
> <tvrtko.ursulin@igalia.com> wrote:
>>
>> In short, this series mostly does a lot of replacing of this pattern:
>>
>>         ib->ptr[ib->length_dw++] = SDMA_PKT_HEADER_OP(SDMA_OP_WRITE) |
>>                 SDMA_PKT_HEADER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR);
>>         ib->ptr[ib->length_dw++] = lower_32_bits(pe);
>>         ib->ptr[ib->length_dw++] = upper_32_bits(pe);
>>         ib->ptr[ib->length_dw++] = ndw - 1;
>>         for (; ndw > 0; ndw -= 2) {
>>                ib->ptr[ib->length_dw++] = lower_32_bits(value);
>>                ib->ptr[ib->length_dw++] = upper_32_bits(value);
>>                 value += incr;
>>         }
>>
>> With this one:
>>
>>         u32 *ptr = &ib->ptr[ib->length_dw];
>>
>>         *ptr++ = SDMA_PKT_HEADER_OP(SDMA_OP_WRITE) |
>>                  SDMA_PKT_HEADER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR);
>>         *ptr++ = lower_32_bits(pe);
>>         *ptr++ = upper_32_bits(pe);
>>         *ptr++ = ndw - 1;
>>         for (; ndw > 0; ndw -= 2) {
>>                 *ptr++ = lower_32_bits(value);
>>                 *ptr++ = upper_32_bits(value);
>>                  value += incr;
>>          }
>>
>>         ib->length_dw = ptr - ib->ptr;
>>
>> Latter avoids register reloads and length updates on every dword written, and on
>> the overall makes the IB emission much more compact:
>>
>> add/remove: 0/1 grow/shrink: 10/58 up/down: 260/-6598 (-6338)
>> Function                                     old     new   delta
>> sdma_v7_0_ring_pad_ib                         99     127     +28
>> sdma_v6_0_ring_pad_ib                         99     127     +28
>> sdma_v5_2_ring_pad_ib                         99     127     +28
>> sdma_v5_0_ring_pad_ib                         99     127     +28
>> sdma_v4_4_2_ring_pad_ib                       99     127     +28
>> sdma_v4_0_ring_pad_ib                         99     127     +28
>> sdma_v3_0_ring_pad_ib                         99     127     +28
>> sdma_v2_4_ring_pad_ib                         99     127     +28
>> cik_sdma_ring_pad_ib                          99     127     +28
>> si_dma_ring_pad_ib                            36      44      +8
>> amdgpu_ring_generic_pad_ib                    56      52      -4
>> si_dma_emit_fill_buffer                      108      71     -37
>> si_dma_vm_write_pte                          158     115     -43
>> amdgpu_vcn_dec_sw_send_msg                   810     767     -43
>> si_dma_vm_copy_pte                           137      87     -50
>> si_dma_emit_copy_buffer                      134      84     -50
>> sdma_v3_0_vm_write_pte                       163     102     -61
>> sdma_v2_4_vm_write_pte                       163     102     -61
>> cik_sdma_vm_write_pte                        163     102     -61
>> sdma_v7_0_vm_write_pte                       168     105     -63
>> sdma_v7_0_emit_fill_buffer                   119      56     -63
>> sdma_v6_0_vm_write_pte                       168     105     -63
>> sdma_v6_0_emit_fill_buffer                   119      56     -63
>> sdma_v5_2_vm_write_pte                       168     105     -63
>> sdma_v5_2_emit_fill_buffer                   119      56     -63
>> sdma_v5_0_vm_write_pte                       168     105     -63
>> sdma_v5_0_emit_fill_buffer                   119      56     -63
>> sdma_v4_4_2_vm_write_pte                     168     105     -63
>> sdma_v4_4_2_emit_fill_buffer                 119      56     -63
>> sdma_v4_0_vm_write_pte                       168     105     -63
>> sdma_v4_0_emit_fill_buffer                   119      56     -63
>> sdma_v3_0_emit_fill_buffer                   116      53     -63
>> sdma_v2_4_emit_fill_buffer                   116      53     -63
>> cik_sdma_emit_fill_buffer                    116      53     -63
>> sdma_v6_0_emit_copy_buffer                   169      76     -93
>> sdma_v5_2_emit_copy_buffer                   169      76     -93
>> sdma_v5_0_emit_copy_buffer                   169      76     -93
>> sdma_v4_4_2_emit_copy_buffer                 169      76     -93
>> sdma_v4_0_emit_copy_buffer                   169      76     -93
>> sdma_v3_0_vm_copy_pte                        158      64     -94
>> sdma_v3_0_emit_copy_buffer                   155      61     -94
>> sdma_v2_4_vm_copy_pte                        158      64     -94
>> sdma_v2_4_emit_copy_buffer                   155      61     -94
>> cik_sdma_vm_copy_pte                         158      64     -94
>> cik_sdma_emit_copy_buffer                    155      61     -94
>> sdma_v6_0_vm_copy_pte                        163      68     -95
>> sdma_v5_2_vm_copy_pte                        163      68     -95
>> sdma_v5_0_vm_copy_pte                        163      68     -95
>> sdma_v4_4_2_vm_copy_pte                      163      68     -95
>> sdma_v4_0_vm_copy_pte                        163      68     -95
>> sdma_v7_0_vm_copy_pte                        183      75    -108
>> sdma_v7_0_emit_copy_buffer                   317     202    -115
>> si_dma_vm_set_pte_pde                        338     214    -124
>> amdgpu_vce_get_destroy_msg                   784     652    -132
>> sdma_v7_0_vm_set_pte_pde                     218      72    -146
>> sdma_v6_0_vm_set_pte_pde                     218      72    -146
>> sdma_v5_2_vm_set_pte_pde                     218      72    -146
>> sdma_v5_0_vm_set_pte_pde                     218      72    -146
>> sdma_v4_4_2_vm_set_pte_pde                   218      72    -146
>> sdma_v4_0_vm_set_pte_pde                     218      72    -146
>> sdma_v3_0_vm_set_pte_pde                     215      69    -146
>> sdma_v2_4_vm_set_pte_pde                     215      69    -146
>> cik_sdma_vm_set_pte_pde                      215      69    -146
>> amdgpu_vcn_unified_ring_ib_header            172       -    -172
>> gfx_v9_4_2_run_shader.constprop              739     532    -207
>> uvd_v6_0_enc_ring_test_ib                   1464    1162    -302
>> uvd_v7_0_enc_ring_test_ib                   1464    1138    -326
>> amdgpu_vce_ring_test_ib                     1357     936    -421
>> amdgpu_vcn_enc_ring_test_ib                 2042    1524    -518
>> Total: Before=9262623, After=9256285, chg -0.07%
>>
>> * Notice how _pad_ib functions have grown. I think the compiler used the
>> opportunity to unroll the loops.
>>
>> ** Series was only smoke tested on the Steam Deck.
>>
>> Tvrtko Ursulin (16):
>>    drm/amdgpu: Use memset32 for IB padding
>>    drm/amdgpu: More compact VCE IB emission
>>    drm/amdgpu: More compact VCN IB emission
>>    drm/amdgpu: More compact UVD 6 IB emission
>>    drm/amdgpu: More compact UVD 7 IB emission
>>    drm/amdgpu: More compact SI SDMA emission
>>    drm/amdgpu: More compact CIK SDMA IB emission
>>    drm/amdgpu: More compact GFX 9.4.2 IB emission
>>    drm/amdgpu: More compact SDMA 2.4 IB emission
>>    drm/amdgpu: More compact SDMA 3.0 IB emission
>>    drm/amdgpu: More compact SDMA 4.0 IB emission
>>    drm/amdgpu: More compact SDMA 4.4.2 IB emission
>>    drm/amdgpu: More compact SDMA 5.0 IB emission
>>    drm/amdgpu: More compact SDMA 5.2 IB emission
>>    drm/amdgpu: More compact SDMA 6.0 IB emission
>>    drm/amdgpu: More compact SDMA 7.0 IB emission
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  12 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c  |  90 +++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c  | 101 ++++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c    | 105 ++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c  |  46 ++++-----
>>   drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   | 108 ++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   | 108 ++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 109 ++++++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 108 ++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 106 ++++++++++++--------
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 110 ++++++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 110 ++++++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   | 119 +++++++++++++----------
>>   drivers/gpu/drm/amd/amdgpu/si_dma.c      |  84 +++++++++-------
>>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c    |  66 +++++++------
>>   drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c    |  66 +++++++------
>>   16 files changed, 849 insertions(+), 599 deletions(-)
>>
>> --
>> 2.48.0
>>

