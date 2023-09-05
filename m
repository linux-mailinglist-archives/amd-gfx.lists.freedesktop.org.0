Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C3792341
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Sep 2023 16:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AAC10E523;
	Tue,  5 Sep 2023 14:02:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC6410E51E
 for <amd-gfx@lists.freedesktop.org>; Tue,  5 Sep 2023 14:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXNnUdVlVP5XmS248SAdQ65i+09mWCoKoec/l2WGFIr6iSWputqMl3wf2+FFcDkrmpbU28kACmnA4NrdeKrqFWlHIRlAigSqZj4xJvVuX/m8XiLpKvrZwshXoxotWtxapuoVq+GBu0xc+mb6ndBxu0GKA9bCVMnC39BKq6z4JSOt+1bTjB84zzrBmMi02er8XXUKSr4IMfbx+4j+e4MxKbhv2nVV+sb3LFqTrzg36cbDxCnqOMd+/KLNf3emUck11erO5chs856Gx0K8ic3zWWSn8iBiWGo3ncwElTbN87wbz2u+4lR6Q8wmQ5yZfi9u070as/zMTw2aLpJ7nrPAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzsD+oP/PKd6l8dFNrwFw5s35EtTT78iEpbZzO0zds4=;
 b=QonyrRRqRr+xculOjRVuR1xLJxxAfwX6NUsmq7ELip14w2649RbgQS1aJMNksHhbQWaBX4SoNigH5FeT7C85DIPQkLte7pJ0aWI+YmDIqu7bncyUgUwSi0KUCYdlQ//4lWzLf+VU79JUy7vJX+vDcAN8I91PCZ5xgdCr90GjP3SswgJqjzG6hv+wsCaG4INbRWJuSO7ArPduFZYiFWD9qTjFEjEQiZg/pj211qjAwriVQNH9NHVZ9XqXadFsWJxxON7u0335lXdLN6ZAc1RYoRWeQ3iVLjMM2bVriRxQ2wG3DJVvNKFQxVKt/wfDAH2ycmo4rfvQEZG+e3H8IMEHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzsD+oP/PKd6l8dFNrwFw5s35EtTT78iEpbZzO0zds4=;
 b=YOlYIfTmHAdRvkdX/PGXGLZwrDKRk/HtTbfWCWHq72QuL0qVmKbA+ps3+DIx+rgyj5O7mg6splvr3IrjE2djleGx1hEm65IlOUlqt1N2g0oYHYuNGEYSmrMNCU4Lhodm2+iOZDAR0GWaQttw70oOzl+FJ1j+E+l30PNsw8hOOd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by CY8PR12MB8266.namprd12.prod.outlook.com (2603:10b6:930:79::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 14:02:54 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::b69d:ce48:b96b:833b]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::b69d:ce48:b96b:833b%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 14:02:54 +0000
Message-ID: <0b40fe2b-7c80-573c-ec1c-64594b840dc2@amd.com>
Date: Tue, 5 Sep 2023 10:02:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdkfd: Use partial migrations in GPU page faults
Content-Language: en-US
To: "Chen, Xiaogang" <xiaogang.chen@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230824220834.362948-1-xiaogang.chen@amd.com>
 <d31985b2-74d9-2536-2995-7b693928d443@amd.com>
 <f744c06c-284f-de8b-8ed2-05d0512823a1@amd.com>
 <ed0dd323-bd99-d2f7-8cbf-6a92e5201f8e@amd.com>
 <8670e751-9a76-b9d9-47f6-05461c279f09@amd.com>
 <fef7aadd-fb8f-f5c2-10e6-b5ebdcf4be56@amd.com>
 <347c4bba-cd60-29a5-6fc0-8f445fd31300@amd.com>
 <85f4c2da-2d8d-4c73-a540-f714ebe6b2e6@amd.com>
 <f57a1e42-52af-0d67-0049-9ed6c58fe0ee@amd.com>
 <0da257e5-85a6-4843-4f49-5666d049110e@amd.com>
 <a83c2317-932b-3a7d-2a54-0ccda4dd77be@amd.com>
From: Philip Yang <yangp@amd.com>
In-Reply-To: <a83c2317-932b-3a7d-2a54-0ccda4dd77be@amd.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::36) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5149:EE_|CY8PR12MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 095a6f33-e200-4faf-c36b-08dbae18cccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmCmwgt2A0RhFmGvotM81g8tTUWk24Qhel1zQIWjj4TFn+VoO/2Rntagm1kI31W6al5s3+SdQrqTdK3iMUDmxCJ6mJk90wTBboPbHKkVkFca3Gj+YUxbw4VbcGK1FXZWJaEIMoXEcy5v1LnKOAoldmmSjuskfYQpUjkGXuxhfI/OcCX0hesqah1keWbOXLRnY8VMVcqX6FOiyiFdcMSAALkXX7t5eeMiUs+cCp8T2Psh3B4P20d+vQHOIuswhPtKsxMrwmp7IrCvy/q0iwZTB49CI/ICVYMFDklqkBjRczQ2VPnzKj0IOYog6HbxZFjNZmau4Hj6iDsrMilSOrzHW6Adihj1tbyCcEe4gI4hQZtEN3FWEtLJkkNA60cO9MEac51UITOsp5IV+HCfKm+L4mFYtEXo43Z6GxM1xFO7tJ0I8I1C9uFKluGHA0cp4X11cPDrr2Xr0fLTMC/XZirP18CjM3e9jClX3iWf7KgZafYGCkEwQzlLiJUXkDsemN628PJh76b+uou4KZxq13ICwZt32e+ApwtNelJb1+Oj10HMP5/B/+SWGaquMarfQ8mIhl2BdJb1W9gK2Kz461qlNq8MDA+dMoqCYRlM5kVcDYO+U8gYPZ8nohUvTsGZC2bW+kz8LivSjb/eh4635EzYpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(1800799009)(451199024)(186009)(38100700002)(41300700001)(110136005)(316002)(66476007)(66556008)(66946007)(2616005)(6512007)(6506007)(6486002)(53546011)(6666004)(478600001)(5660300002)(8676002)(8936002)(4326008)(26005)(2906002)(31696002)(31686004)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXZ3azZUNTJSb0tsN1FjSnpDT0RNVGNVZWswdFJSL21aVnlmN3k3aUJBYW55?=
 =?utf-8?B?VWsvL29iTG1Uc1ZNbGduQVpaTmZqVEFVSllNWXc1MGhTWE50SUI2WmFmcnVD?=
 =?utf-8?B?LzB4dXA0WkgrUjdTZkJHV2xqT1hMVElEay84dlNSbW9EdUdMQ3RRUmU5Sjdo?=
 =?utf-8?B?cDN3K3hseXhhL1YvVERFMHllWmF1Y3pLV01Lc2JwUDkrVDVUSDU4K0hPcnV2?=
 =?utf-8?B?L01wRWdCQ1hkcGRtb0RLNENzOVBJbGZsRXBkZk1ZVUhGQzhmSHpIeGhXK25F?=
 =?utf-8?B?MXhXN01ubmdDWTNHUjdHWFdQVk1VVTh3V1VuTEFzTXhQaS9ocmNjQ3FZekM3?=
 =?utf-8?B?d2Ftby9uN29jQlh0elk1MDhIMHBkN2Z1RmsrOTQ1QXhnQjltaHF0aEFlQ1lD?=
 =?utf-8?B?QTNOS3N1cGRyQWFhRUhqSVU4b0cvMWkzNktHbENSWWtqMkI4UDRsdkgxdGxN?=
 =?utf-8?B?MVFzSURsVE9PT3crOEdxOVlIM3p3S3B0cEduQWxicENkNVhNakdKRTNRaG9n?=
 =?utf-8?B?T214djcza0F3NlFhWHN2RWN4UzFJZWdQTU1aWkxzYVFpNGZ5cGp1YjNPZThT?=
 =?utf-8?B?MEhkRklNMlR5OHpyMFBsTlBOQ0RvMXZkSzd2WVY3SUJQSnV0dGJ1YWhMQmpQ?=
 =?utf-8?B?bjJGcUUyTFUxZmJFU2YzejljZTA1bDc2dFFZd0srSEFvV1VrY0JPdzk5ckda?=
 =?utf-8?B?ZjY2b09OdW1rV2MrbDNlNnBSRms4T3lMRDhPb0RBOC9hMUw5N3BrQW42R2RI?=
 =?utf-8?B?RVVzOFVMM2JlblJpTWxTb1FuaDg1RjJmZnNLaHJKWEhONCtjc1ZEL3kyRmdI?=
 =?utf-8?B?ZzNYWUJoK2xSbUFWN1Y4YWQwY0lUenNLdjZaeHNpZEt4a0drNjNmbytQWFdO?=
 =?utf-8?B?cmR4N0pjRXVzdkNUNXluUGdUOC9INXE4VXAvY2syR3NIYmxpc3pMNXprTktx?=
 =?utf-8?B?a0FNRXdWV3V6eGlLZEJFREdnVTJMeTJDKzl1S2hUWEQ5Tjc2Sk1OWC9YaVVw?=
 =?utf-8?B?c201V3lOdStkZGw5WEQ0a1dGSmx2TFpDSHVKS2MrSmw3SjY3dzd4NkUvSTdD?=
 =?utf-8?B?aGRlWkdpT2kwcXZrY0kvSklNUmZiNFRtdllGZWFZdWpRUzBVZ3k1bTZ5dUZk?=
 =?utf-8?B?dmhVVWdNVEhpck1WaW5Mcm9YbHJIZEhxaitiUitQWUxUMjlDUDUvUkZrYkRv?=
 =?utf-8?B?N1dhVGg4QUlpS1ZEUG8xbmpobEZiN3FsOUxCc2xmQ295bzVQdnlPempzcFBC?=
 =?utf-8?B?NlNxdXMvM0pPeGdMOFBaWjkrVUt0K2ZNVXFkZDJYK0xxQ1BDWForbjcxcHd6?=
 =?utf-8?B?YXltTjZNc3djVUFJS1Y2WWhDNDZOMS9EQXBZNi90TVJFTXJnZ2hUdHdpNjkr?=
 =?utf-8?B?MkJBL3NINDViOUdmSDQxSlc5Vlk1M01xeHVxa2k2UXhsRUpjSUN2MGRrMVBm?=
 =?utf-8?B?UlBoRG9HUDR5WEFuaUpjcnJBMU4vT1hkVEQrTTB5NDYyYWQxbTVYcG1VSnph?=
 =?utf-8?B?SnlwcEZvYnBmREJacm1kaDVReTJlaGphTzNKVzZqYUpCSisvMHk1RWhhRk9n?=
 =?utf-8?B?TWo4TFFDdG1GU0NPMDNuUEVPWE1YWmpzd085Q3pMcFRGNEFDb0J6a096V0xs?=
 =?utf-8?B?ck1lWUcycjBrWGhKVnRyL2tJNnViTWFrOHNKNDZpand6d1p4SzZoblZPQ0hY?=
 =?utf-8?B?K3Z0Qlo5MFkwOW9UaGVYOC9TME0xWGtNVUxzLzB4QThvUkZ1aHQ0YjBwOVQ1?=
 =?utf-8?B?dmRlVlFSZVlmUWNOUThWNHlsUitUNkkwUW5NNkVKMllQaGFNczh6REM1bVpl?=
 =?utf-8?B?MDlmL2Y1YWI4MDZ2UlYvODNvQnlmdUNIUjNxQ1diQi9RemkyYURvRFRwQUkz?=
 =?utf-8?B?VFltd2N4VWZXM1BwUHk3OVlORnlpbXpRajN5RDdvRG5DWkRad0xHZ1NpWjVT?=
 =?utf-8?B?SURkODRkYTV5WWJJcmhZMWxzMUt3bHVxdk1JQlZleEZ6dkVwSUlLaGlYUzZP?=
 =?utf-8?B?RzBuUXpNRG85YUtoSTVHVTkzOUVYZTczVTIzQ2ZxM3dhSGVLWjBxVjZsYklz?=
 =?utf-8?B?TEUrdUNvS0xISnRQSkJWMDZmaTBhaUc1akpXQmxiWmdFOUtXOW1IRUZiemx3?=
 =?utf-8?Q?KeaqHSCXRoQgc4p98enUVWyLX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095a6f33-e200-4faf-c36b-08dbae18cccd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 14:02:54.3249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICRy5/IdATySHfPhgDVmMaycTQI5XvmP+ePkR8KqvcN6dP7vVOCQ2qEmgCQO7OoP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8266
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
Cc: Philip.Yang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-08-31 17:29, Chen, Xiaogang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a83c2317-932b-3a7d-2a54-0ccda4dd77be@amd.com">
      <br>
      On 8/31/2023 3:59 PM, Felix Kuehling wrote:
      <br>
      <blockquote type="cite">On 2023-08-31 16:33, Chen, Xiaogang wrote:
        <br>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">That said, I'm not actually
                    sure why we're freeing the DMA address array after
                    migration to RAM at all. I think we still need it
                    even when we're using VRAM. We call
                    svm_range_dma_map in svm_range_validate_and_map
                    regardless of whether the range is in VRAM or system
                    memory. So it will just allocate a new array the
                    next time the range is validated anyway. VRAM pages
                    use a special address encoding to indicate VRAM
                    pages to the GPUVM code.
                    <br>
                  </blockquote>
                  <br>
                  I think we do not need free DMA address array as you
                  said, it is another thing though.
                  <br>
                  <br>
                  We need unmap dma address(dma_unmap_page) after
                  migrate from ram to vram because we always do
                  dma_map_page at svm_range_validate_and_map. If not we
                  would have multiple dma maps for same sys ram page.
                  <br>
                </blockquote>
                <br>
                svm_range_dma_map_dev calls dma_unmap_page before
                overwriting an existing valid entry in the dma_addr
                array. Anyway, dma unmapping the old pages in bulk may
                still be cleaner. And it avoids delays in cleaning up
                DMA mappings after migrations.
                <br>
                <br>
                Regards,
                <br>
                &nbsp; Felix
                <br>
                <br>
                <br>
              </blockquote>
              then we may not need do dma_unmap after migrate from ram
              to vram since svm_range_dma_map_dev always do
              dma_unmap_page if the address is valid dma address for sys
              ram, and after migrate from ram to vram we always do gpu
              mapping?
              <br>
            </blockquote>
            <br>
            I think with XNACK enabled, the DMA mapping may be delayed
            until a page fault. For example on a multi-GPU system, GPU1
            page faults and migrates data from system memory to its
            VRAM. Immediately afterwards, the page fault handler should
            use svm_validate_and_map to update GPU1 page tables. But
            GPU2 page tables are not updated immediately. So the now
            stale DMA mappings for GPU2 would continue to exist until
            the next page fault on GPU2.
            <br>
            <br>
            Regards,
            <br>
            &nbsp; Felix
            <br>
            <br>
          </blockquote>
          If I understand correctly: when user call svm_range_set_attr,
          if p-&gt;xnack_enabled is true, we can skip call
          svm_range_validate_and_map. We postpone the buffer validating
          and gpu mapping until page fault or the time the buffer really
          got used by a GPU, and only dma map and gpu map for this GPU.
          <br>
        </blockquote>
        <br>
        The current implementation of svm_range_set_attr skips the
        validation after migration if XNACK is off, because it is
        handled by svm_range_restore_work that gets scheduled by the MMU
        notifier triggered by the migration.
        <br>
        <br>
        With XNACK on, svm_range_set_attr currently validates and maps
        after migration assuming that the data will be used by the
        GPU(s) soon. That is something we could change and let page
        faults take care of the mappings as needed.
        <br>
        <br>
      </blockquote>
      Yes, with xnack on, my understanding is we can skip
      svm_range_validate_and_map at svm_range_set_attr after migration,
      then page fault handler will do dma and gpu mapping. That would
      save the first time dma and gpu mapping which apply to all GPUs
      that user ask for access. Then current gpu page fault handler just
      does dma and gpu mapping for the GPU that triggered page fault. Is
      that ok?
      <br>
    </blockquote>
    <p>With xnack on, after prefetch the range to GPU, need
      svm_range_validate_and_map to update the mapping of the GPU
      migrated to (also the mapping of GPUs with access_in_place),
      because app prefetch to GPU to avoid GPU page fault.</p>
    <p>After migrating to VRAM, we only need dma_unmap_page from
      prange-&gt;dma_addr array, don't need to free the dma_addr array
      itself, as it can be reused to store VRAM address to map to GPU. <br>
    </p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:a83c2317-932b-3a7d-2a54-0ccda4dd77be@amd.com">
      <br>
      Regards
      <br>
      <br>
      Xiaogang
      <br>
      <br>
      <blockquote type="cite">Regards,
        <br>
        &nbsp; Felix
        <br>
        <br>
        <br>
      </blockquote>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          Regards
          <br>
          <br>
          Xiaogang </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>
